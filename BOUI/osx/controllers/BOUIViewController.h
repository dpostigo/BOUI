//
// Created by Dani Postigo on 2/3/14.
// Copyright (c) 2014 First Person, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPViewController.h"

@class BOUIModel;

@interface BOUIViewController : DPViewController {
    BOUIModel *_model;
}

- (NSOperationQueue *) queue;
- (BOUIModel *) model;

@end