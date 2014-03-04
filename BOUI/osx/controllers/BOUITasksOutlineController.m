//
// Created by Dani Postigo on 3/4/14.
//

#import "BOUITasksOutlineController.h"

@implementation BOUITasksOutlineController



- (void) awakeFromNib {
    [super awakeFromNib];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    NSLog(@"self.view = %@", self.view);
}


- (id) initWithNibName: (NSString *) nibNameOrNil bundle: (NSBundle *) nibBundleOrNil {
    self = [super initWithNibName: nibNameOrNil bundle: nibBundleOrNil];
    if (self) {
        NSLog(@"%s", __PRETTY_FUNCTION__);
    }

    return self;
}

- (id) initWithCoder: (NSCoder *) coder {
    self = [[BOUITasksOutlineController alloc] init];
//
//    self = [super initWithCoder: coder];
//    if (self) {
//        NSLog(@"%s", __PRETTY_FUNCTION__);
//
//    }

    return self;
}

- (id) init {
    self = [super init];
    if (self) {
        NSLog(@"%s", __PRETTY_FUNCTION__);
    }

    return self;
}


@end