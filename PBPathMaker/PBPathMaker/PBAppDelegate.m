/*
 *  PBAppDelegate.m
 *  PBPathMaker
 *
 *  Created by bearkode on 13. 1. 31..
 *  Copyright (c) 2013 PrisonBreak. All rights reserved.
 *
 */

#import "PBAppDelegate.h"
#import "PBPathView.h"


@implementation PBAppDelegate
{
    PBPathView     *mPathView;
    NSTextField    *mFramerate;
    
    NSMutableArray *mPoints;
    
    NSTimer        *mReplayTimer;
    NSInteger       mReplayIndex;
}


@synthesize pathView  = mPathView;
@synthesize framerate = mFramerate;


#pragma mark -


- (void)dealloc
{
    [mPoints release];
    
    [super dealloc];
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

}


#pragma mark -


- (void)awakeFromNib
{
    [mPathView setDelegate:self];
}


#pragma mark -


- (IBAction)createNewPathButtonTapped:(id)aSender
{
    NSLog(@"create new button");
}


- (IBAction)savePathButtonTapped:(id)aSender
{
    NSLog(@"save button");
    
    NSMutableArray *sArray = [NSMutableArray array];

    for (NSValue *sValue in mPoints)
    {
        NSDictionary *sDict = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:[sValue pointValue].x], @"x",
                                                                         [NSNumber numberWithFloat:[sValue pointValue].y], @"y", nil];
        [sArray addObject:sDict];
    }
    
    NSData *sData = [NSJSONSerialization dataWithJSONObject:sArray options:0 error:nil];
    [sData writeToFile:@"/Users/cgkim/Desktop/path.json" atomically:YES];
}


- (IBAction)openPathButtonTapped:(id)aSender
{
    NSLog(@"open button");
}


- (IBAction)recordingButtonTapped:(id)aSender
{
    NSLog(@"recording");
}


- (IBAction)replayButtonTapped:(id)aSender
{
    NSString *sFramerateStr = [mFramerate stringValue];
    CGFloat   sFramerate    = [sFramerateStr floatValue];
    
    NSLog(@"framerate = %f", 1 / sFramerate);
    
    if (sFramerate > 0)
    {
        [mPathView setStartPoint:[[mPoints objectAtIndex:0] pointValue]];
        
        mReplayTimer = [NSTimer scheduledTimerWithTimeInterval:(1 / sFramerate)
                                                        target:self
                                                      selector:@selector(replayTimerTick:)
                                                      userInfo:nil
                                                       repeats:YES];
        mReplayIndex = 1;
    }
}


- (IBAction)editButtonTapped:(id)aSender
{

}


#pragma mark -


- (void)replayTimerTick:(NSTimer *)aTimer
{
    if (mReplayIndex < [mPoints count])
    {
        NSLog(@"11");
        [mPathView moveWithVector:[[mPoints objectAtIndex:mReplayIndex] pointValue]];
        mReplayIndex++;
    }
    else
    {
        [mReplayTimer invalidate];
        mReplayTimer = nil;
    }
}


- (void)pathView:(PBPathView *)aPathView didBeginRecordFrom:(NSPoint)aBeginPoint
{
    NSLog(@"begin from %@", NSStringFromPoint(aBeginPoint));
    
    [mPoints autorelease];
    mPoints = [[NSMutableArray alloc] init];
    
    [mPoints addObject:[NSValue valueWithPoint:aBeginPoint]];
    [mPathView setStartPoint:aBeginPoint];
}


- (void)pathView:(PBPathView *)aPathView didRecordVector:(NSPoint)aVector
{
    NSLog(@"vector = %@", NSStringFromPoint(aVector));
    
    [mPoints addObject:[NSValue valueWithPoint:aVector]];
    [mPathView moveWithVector:aVector];
}


- (void)pathViewDidEndRecord:(PBPathView *)aPathView
{
    NSLog(@"end");
}


@end
