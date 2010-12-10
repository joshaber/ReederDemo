//
//  RDSecondViewController.m
//  ReederDemo
//
//  Created by Josh Abernathy on 12/9/10.
//  Copyright 2010 Maybe Apps, LLC. All rights reserved.
//

#import "RDSecondViewController.h"


@implementation RDSecondViewController


#pragma mark API

+ (RDSecondViewController *)defaultViewController {
    return [[[self alloc] initWithNibName:NSStringFromClass(self) bundle:nil] autorelease];
}

@end
