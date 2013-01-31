/*
 *  PBAppDelegate.m
 *  PBPathMaker
 *
 *  Created by bearkode on 13. 1. 31..
 *  Copyright (c) 2013 PrisonBreak. All rights reserved.
 *
 */

#import "PBAppDelegate.h"


@implementation PBAppDelegate
{
    PBPathView *mPathView;
}


@synthesize pathView = mPathView;


#pragma mark -


- (void)dealloc
{
    [super dealloc];
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

}


#pragma mark -


- (IBAction)createNewPathButtonTapped:(id)aSender
{
    NSLog(@"create new button");
}


- (IBAction)savePathButtonTapped:(id)aSender
{
    NSLog(@"save button");
}


- (IBAction)openPathButtonTapped:(id)aSender
{
    NSLog(@"open button");
}


@end
