//
//  Model.m
//  Carts
//
//  Created by Daniela Postigo on 10/21/13.
//  Copyright (c) 2013 Elastic Creative. All rights reserved.
//

#import <BOAPI/User.h>
#import <BOAPI/Log.h>
#import <BOAPI/BOAPIModel+Utils.h>
#import "BOUIModel.h"
#import "NSObject+UserDefaults.h"
#import "BOFocusTypes.h"
#import "Job.h"
#import "Task.h"
#import "ServiceItem.h"
//#import "Model+TaskUtils.h"

@implementation BOUIModel

@synthesize selectedJob;
@synthesize selectedTask;
@synthesize selectedArtist;

@synthesize controllers;
@synthesize usesDummyData;

NSString *const kBOPreferenceAutologin = @"kBOPreferenceAutologin_Debug";

+ (BOUIModel *) sharedModel {
    static BOUIModel *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];

        }
    }

    return _instance;
}


- (id) init {
    self = [super init];
    if (self) {
        //        [self addObserver: self forKeyPath: @"selectedFocusType" options: 0 context: NULL];
        //        [self addObserver: self forKeyPath: @"selectedTask" options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context: NULL];
    }

    return self;
}


- (BOOL) autologins {
    return [[self savedObjectForKey: kBOPreferenceAutologin] boolValue];
}

- (void) setAutologins: (BOOL) autologins {
    [self saveObject: [NSNumber numberWithBool: autologins] forKey: kBOPreferenceAutologin];
}



#pragma mark Getters


- (BOAPIModel *) apiModel {
    return [BOAPIModel sharedModel];
}


- (NSOperationQueue *) queue {
    return self.apiModel.queue;
}

#pragma mark Defaults

- (void) setUsername: (NSString *) username {
    [self saveObject: username forKey: @"username"];
}

- (NSString *) username {
    NSString *ret = [self savedObjectForKey: @"username"];
    if (ret == nil) {
        ret = @"";
    } else {
        //        [BOAPIModel sharedModel].storage.username = ret;
    }
    return ret;
}





#pragma mark Selected object setters




- (void) setSelectedFocusType: (NSString *) selectedFocusType1 {
    if (![selectedFocusType1 isEqualToString: kBOFocusTypeJobs] && ![selectedFocusType1 isEqualToString: kBOFocusTypeJobs]) {
        self.selectedJob = nil;
        self.selectedArtist = nil;
    }
    selectedFocusType = [selectedFocusType1 mutableCopy];
    [self notifyDelegates: @selector(modelDidSelectFocusType) object: nil];

}

- (void) setSelectedJob: (Job *) selectedJob1 {
    selectedJob = selectedJob1;
    if (selectedJob) {
        self.selectedFocusType = kBOFocusTypeJobs;
    }
}


- (void) setSelectedTask: (Task *) selectedTask1 {
    selectedTask = selectedTask1;
    if (selectedTask) {
        if (selectedTask.isCreated) {
            NSLog(@"Is created.");
            [self notifyDelegates: @selector(modelDidSelectTask:) object: selectedTask];
        } else {
            [self notifyDelegates: @selector(modelDidCreateTask:) object: selectedTask];
        }
    }
}





#pragma mark Data getters


- (void) setJobs: (NSMutableArray *) jobs {
    [BOAPIModel sharedModel].jobs = jobs;
}

- (NSMutableArray *) jobs {
    return [BOAPIModel sharedModel].jobs;
}

- (NSMutableArray *) tasks {
    return [BOAPIModel sharedModel].tasks;
}


- (void) setContacts: (NSMutableArray *) contacts {
    [BOAPIModel sharedModel].contacts = contacts;

}

- (NSMutableArray *) contacts {
    return [BOAPIModel sharedModel].contacts;
}


- (User *) currentUser {
    return self.apiModel.user;
}

- (void) setCurrentUser: (User *) currentUser1 {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self.apiModel.user = currentUser1;
}

- (NSMutableArray *) serviceItems {
    return [BOAPIModel sharedModel].serviceItems;
}



#pragma mark Getters

- (NSMutableDictionary *) controllers {
    if (controllers == nil) {
        controllers = [[NSMutableDictionary alloc] init];
    }
    return controllers;
}


- (NSString *) selectedFocusType {
    if (selectedFocusType == nil) {
        selectedFocusType = [NSString stringWithFormat: @"%@", kBOFocusTypeMyTasks];
    }
    return selectedFocusType;
}

#pragma mark Dummy data


- (void) setUsesDummyData: (BOOL) usesDummyData1 {
    usesDummyData = usesDummyData1;

    if (usesDummyData) {
        [self.serviceItems addObject: [[ServiceItem alloc] initWithTitle: @"Design"]];
        [self.serviceItems addObject: [[ServiceItem alloc] initWithTitle: @"Development"]];

        User *user = [[User alloc] initWithTitle: @"Dani"];
        user.id = @"1";
        [self.contacts addObject: user];
        self.currentUser = user;

        Task *task = self.dummyTask;
        task.assignee = user;

        Job *job = [[Job alloc] initWithTitle: @"Dummy job"];
        job.id = @"1";
        task.job = job;

        [self.tasks addObject: task];
        [self.jobs addObject: job];

        [self notifyDelegates: @selector(tasksDidUpdate) object: nil];
    }
}


- (Task *) dummyTask {
    Task *task = [[Task alloc] initWithTitle: @"Task"];
    task.id = @"1";

    [task.logs addObject: [self dummyLog: 1]];
    [task.logs addObject: [self dummyLog: 2]];
    [task.logs addObject: [self dummyLog: 3]];
    [task.logs addObject: [self dummyLog: 4]];
    return task;

}

- (Log *) dummyLog: (NSUInteger) index {
    Log *log = [[Log alloc] initWithTitle: [NSString stringWithFormat: @"Log note %lu", index]];
    log.serviceItem = [self.serviceItems objectAtIndex: 0];
    log.id = [NSString stringWithFormat: @"%lu", index];
    log.date = [NSDate date];
    return log;

}


#pragma mark Actions

- (void) signOut {

    [self.apiModel signOut];

    [self saveObject: @"nouser" forKey: kBOStoredUsername];
    [self notifyDelegates: @selector(userDidSignOff) object: nil];
}


- (void) createTask: (NSString *) name {

    Job *job = nil;

    if (self.selectedTask) {
        job = self.selectedTask.job;
    } else if ([self.selectedFocusType isEqualToString: kBOFocusTypeJobs]) {
        job = self.selectedJob;
    } else {
        //  job = [[self.apiModel jobsForTaskArray: self.tasksForSelectedFocusType] lastObject];
    }

    [self createTask: name withJob: job];

}

- (void) createTask: (NSString *) name withJob: (Job *) job {

    Task *task = [[Task alloc] initWithTitle: name];
    task.job = job;
    task.id = @"-";
    [self.tasks addObject: task];

    //  [self.apiModel notifyDelegates: @selector(tasksDidUpdate:) object: task];
    // [self.apiModel notifyDelegates: @selector(tasksDidUpdate) object: nil];
    self.selectedTask = task;

}




#pragma mark BOAPIDelegate

- (void) taskDidInit: (Task *) task {
    self.selectedTask = task;

}

@end


