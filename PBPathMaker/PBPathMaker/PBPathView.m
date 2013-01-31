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


#pragma mark -


- (void)setup
{

}


#pragma mark -


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
    
    }
    
    return self;
}


- (id)initWithFrame:(NSRect)aFrame
{
    self = [super initWithFrame:aFrame];
    
    if (self)
    {
    
    }
    
    return self;
}


- (void)dealloc
{
    [super dealloc];
}


- (void)drawRect:(NSRect)aRect
{
    [[NSColor blackColor] setFill];
    NSRectFill([self bounds]);
}


@end
