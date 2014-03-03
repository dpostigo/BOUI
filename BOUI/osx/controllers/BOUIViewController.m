//
// Created by Dani Postigo on 2/3/14.
// Copyright (c) 2014 First Person, Inc. All rights reserved.
//

#import <BOAPI/BOAPIModel.h>
#import "BOUIViewController.h"
#import "BOUIModel.h"

@implementation BOUIViewController

- (void) setup {
    [super setup];
    _model = [BOUIModel sharedModel];
    //[_model subscribeDelegate: self];
    //[_model.apiModel subscribeDelegate: self];
}

- (NSOperationQueue *) queue {
    return [BOAPIModel sharedModel].queue;
}

@end