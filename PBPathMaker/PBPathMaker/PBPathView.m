/*
 *  PBPathView.m
 *  PBPathMaker
 *
 *  Created by bearkode on 13. 1. 31..
 *  Copyright (c) 2013 PrisonBreak. All rights reserved.
 *
 */

#import "PBPathView.h"


@implementation PBPathView
{
    id              mDelegate;
    NSPoint         mBeforePoint;
    
    NSMutableArray *mPoints;
}


@synthesize delegate = mDelegate;



#pragma mark -


- (void)setup
{
    mBeforePoint = NSMakePoint(0, 0);
}


#pragma mark -


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self setup];
    }
    
    return self;
}


- (id)initWithFrame:(NSRect)aFrame
{
    self = [super initWithFrame:aFrame];
    
    if (self)
    {
        [self setup];
    }
    
    return self;
}


- (void)dealloc
{
    [mPoints release];
    
    [super dealloc];
}


#pragma mark -


- (BOOL)isFlipped
{
    return YES;
}


- (void)drawRect:(NSRect)aRect
{
    [[NSColor blackColor] setFill];
    NSRectFill([self bounds]);

    [[NSColor whiteColor] setStroke];
    
    NSBezierPath *sPath = [NSBezierPath bezierPath];
    [sPath setLineWidth:2];
    
    for (NSValue *sPoint in mPoints)
    {
        if ([mPoints objectAtIndex:0] == sPoint)
        {
            [sPath moveToPoint:[sPoint pointValue]];
        }
        else
        {
            [sPath lineToPoint:[sPoint pointValue]];
        }
    }
    [sPath stroke];
}


#pragma mark -


- (void)setStartPoint:(NSPoint)aPoint
{
    [mPoints autorelease];
    mPoints = [[NSMutableArray alloc] init];
    
    [mPoints addObject:[NSValue valueWithPoint:aPoint]];
    
    [self setNeedsDisplay:YES];
}


- (void)moveWithVector:(NSPoint)aPoint
{
    NSPoint sBeforePoint = [[mPoints lastObject] pointValue];
    NSPoint sPoint       = NSMakePoint(sBeforePoint.x + aPoint.x, sBeforePoint.y + aPoint.y);

    [mPoints addObject:[NSValue valueWithPoint:sPoint]];
    
    [self setNeedsDisplay:YES];
}


#pragma mark -


- (void)mouseDown:(NSEvent *)aEvent
{
    NSPoint sPoint = [self convertPoint:[aEvent locationInWindow] fromView:nil];
    
    mBeforePoint = sPoint;
    
    [mDelegate pathView:self didBeginRecordFrom:sPoint];
}


- (void)mouseUp:(NSEvent *)aEvent
{
    mBeforePoint = NSMakePoint(0, 0);
    
    [mDelegate pathViewDidEndRecord:self];
}


- (void)mouseDragged:(NSEvent *)aEvent
{
    NSPoint sPoint = [self convertPoint:[aEvent locationInWindow] fromView:nil];
 
    sPoint = NSMakePoint((NSInteger)sPoint.x, (NSInteger)sPoint.y);

    [mDelegate pathView:self didRecordVector:NSMakePoint(sPoint.x - mBeforePoint.x, sPoint.y - mBeforePoint.y)];
    mBeforePoint = sPoint;
}


@end
