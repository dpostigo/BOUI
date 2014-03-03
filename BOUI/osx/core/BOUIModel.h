//
//  Model.h
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasicModel.h"
#import "BOAPIDelegate.h"

@class Job;
@class Task;
@class BOAPIModel;

@interface BOUIModel : BasicModel <BOAPIDelegate> {

    BOOL usesDummyData;

    Job *selectedJob;
    Task *selectedTask;
    User *selectedArtist;
    NSString *selectedFocusType;

    NSMutableDictionary *controllers;
}

@property(nonatomic, strong) NSString *username;


@property(nonatomic, copy) NSString *selectedFocusType;
@property(nonatomic, strong) User *currentUser;
@property(nonatomic, strong) User *selectedArtist;
@property(nonatomic, strong) Job *selectedJob;
@property(nonatomic, strong) Task *selectedTask;
@property(nonatomic) BOOL usesDummyData;

@property(nonatomic, strong) NSMutableArray *jobs;
@property(nonatomic, strong) NSMutableArray *contacts;
@property(nonatomic, strong) NSMutableArray *serviceItems;


@property(nonatomic, strong) NSMutableDictionary *controllers;
+ (BOUIModel *) sharedModel;
- (NSMutableArray *) tasks;

- (void) signOut;
- (void) createTask: (NSString *) name;
- (BOAPIModel *) apiModel;
@end