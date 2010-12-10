//
//  ReederDemoAppDelegate.m
//  ReederDemo
//
//  Created by Josh Abernathy on 12/9/10.
//  Copyright 2010 Maybe Apps, LLC. All rights reserved.
//

#import "ReederDemoAppDelegate.h"
#import "RDFirstViewController.h"
#import "RDSecondViewController.h"

@interface ReederDemoAppDelegate ()
@property (nonatomic, readonly) NSView *currentTabView;
@property (nonatomic, assign) NSInteger selectedSegment;
@end


@implementation ReederDemoAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    [self.contentHoldingView setAnimations:nil];
    
    NSView *newView = [RDFirstViewController defaultViewController].view;
    newView.frame = self.contentHoldingView.bounds;
    [newView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [self.contentHoldingView addSubview:newView];
    self.selectedSegment = 0;
}


#pragma mark API

@synthesize window;
@synthesize contentHoldingView;
@synthesize selectedSegment;

- (IBAction)didSelectSegment:(NSSegmentedControl *)segmentedControl {
    if([segmentedControl selectedSegment] == self.selectedSegment) return;
    
    self.selectedSegment = [segmentedControl selectedSegment];
    
    [NSAnimationContext beginGrouping];
    
    const CFTimeInterval duration = ([self.window currentEvent].modifierFlags & NSShiftKeyMask) ? 10.0f : 0.33f;
    CATransition *pushAnimation = [CATransition animation];
    pushAnimation.duration = duration;
    pushAnimation.type = kCATransitionPush;
    pushAnimation.subtype = [segmentedControl selectedSegment] == 0 ? kCATransitionFromLeft : kCATransitionFromRight;
    [pushAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [self.contentHoldingView setAnimations:[NSDictionary dictionaryWithObject:pushAnimation forKey:@"subviews"]];
    
    NSView *newView = [segmentedControl selectedSegment] == 0 ? [RDFirstViewController defaultViewController].view : [RDSecondViewController defaultViewController].view;
    newView.frame = self.contentHoldingView.bounds;
    [newView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    [[self.contentHoldingView animator] replaceSubview:self.currentTabView with:newView];

    [NSAnimationContext endGrouping];
}

- (NSView *)currentTabView {
    return [self.contentHoldingView.subviews objectAtIndex:0];
}

@end
