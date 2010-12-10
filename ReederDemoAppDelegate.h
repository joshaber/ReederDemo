//
//  ReederDemoAppDelegate.h
//  ReederDemo
//
//  Created by Josh Abernathy on 12/9/10.
//  Copyright 2010 Maybe Apps, LLC. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ReederDemoAppDelegate : NSObject <NSApplicationDelegate> {}

- (IBAction)didSelectSegment:(NSSegmentedControl *)segmentedControl;

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSView *contentHoldingView;

@end
