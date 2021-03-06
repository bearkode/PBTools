/*
 *  PBAppDelegate.h
 *  PBPathMaker
 *
 *  Created by bearkode on 13. 1. 31..
 *  Copyright (c) 2013 PrisonBreak. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>


@class PBPathView;


@interface PBAppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, assign) IBOutlet NSWindow    *window;
@property (nonatomic, assign) IBOutlet PBPathView  *pathView;
@property (nonatomic, assign) IBOutlet NSTextField *framerate;

- (IBAction)createNewPathButtonTapped:(id)aSender;
- (IBAction)savePathButtonTapped:(id)aSender;
- (IBAction)openPathButtonTapped:(id)aSender;
- (IBAction)recordingButtonTapped:(id)aSender;
- (IBAction)replayButtonTapped:(id)aSender;
- (IBAction)editButtonTapped:(id)aSender;

@end
