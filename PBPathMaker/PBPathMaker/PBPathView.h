/*
 *  PBPathView.h
 *  PBPathMaker
 *
 *  Created by bearkode on 13. 1. 31..
 *  Copyright (c) 2013 PrisonBreak. All rights reserved.
 *
 */

#import <Cocoa/Cocoa.h>


@interface PBPathView : NSView

@property (nonatomic, assign) id delegate;

- (void)setStartPoint:(NSPoint)aPoint;
- (void)moveWithVector:(NSPoint)aPoint;

@end


@protocol PBPathViewMouseDelegate <NSObject>

- (void)pathView:(PBPathView *)aPathView didBeginRecordFrom:(NSPoint)aBeginPoint;
- (void)pathView:(PBPathView *)aPathView didRecordVector:(NSPoint)aVector;
- (void)pathViewDidEndRecord:(PBPathView *)aPathView;

@end