//
// Created by Dani Postigo on 3/4/14.
//

#import "BOUITasksOutlineView.h"
#import "NSView+DPKit.h"

@implementation BOUITasksOutlineView

//
//- (id) initWithFrame: (NSRect) frameRect {
//NSView *view = [self loadFromNib: [self className]];
//    NSLog(@"view = %@", view);
//    if (self == nil) {
//        self = [super initWithFrame: frameRect];
//        if (self) {
//
//        }
//    }
//
//    return self;
//}

//
//- (id) initWithFrame: (NSRect) frameRect {
//
//    NSString *nibName = [self className];
//    //
//    //    id ret = nil;
//    //    NSNib *nib = [[NSNib alloc] initWithNibNamed: nibName bundle: nil];
//    //    NSArray *topLevelObjects;
//    //
//    //
//    //    NSObject *object = [[NSObject alloc] init];
//    //    BOOL success = [nib instantiateWithOwner: self topLevelObjects: &topLevelObjects];
//    //    NSLog(@"success = %d", success);
//    //    NSLog(@"topLevelObjects = %@", topLevelObjects);
//    //
//    //    if (success) {
//    //        for (id topLevelObject in topLevelObjects) {
//    //            if ([topLevelObject isKindOfClass: [self class]]) {
//    //                ret = topLevelObject;
//    //                break;
//    //            }
//    //        }
//    //    }
//    //
//    //    NSLog(@"ret = %@", ret);
//    //    NSViewController *controller = [[NSViewController alloc] initWithNibName: nibName bundle: nil];
//    //    NSLog(@"controller.view = %@", controller.view);
//    //    self = controller.view;
//    //    self = [super initWithFrame: frameRect];
//    //    if (self) {
//    //
//    //    }
//
//
//
//
//    NSNib *nib = [[NSNib alloc] initWithNibNamed: nibName bundle: nil];
//    NSArray *topLevelObjects;
//    if (![nib instantiateWithOwner: self topLevelObjects: &topLevelObjects]) {
//
//    }// error
//
//    id myView = nil;
//    for (id topLevelObject in topLevelObjects) {
//        if ([topLevelObject isKindOfClass: [self class]]) {
//            myView = topLevelObject;
//            break;
//        }
//    }
//    self = myView;
//
//    return self;
//}

- (id) initWithFrame: (NSRect) frameRect {

    NSViewController *controller = [[NSViewController alloc] initWithNibName: [self className] bundle: nil];
    self = controller.view;
    self.frame = frameRect;
    return self;

    //    NSString *nibName = [self className];
    //    id ret = nil;
    //    NSNib *nib = [[NSNib alloc] initWithNibNamed: nibName bundle: nil];
    //    NSArray *topLevelObjects;
    //
    //    BOOL success = [nib instantiateWithOwner: self topLevelObjects: &topLevelObjects];
    //
    //    if (success) {
    //        for (id topLevelObject in topLevelObjects) {
    //            NSLog(@"topLevelObject = %@", topLevelObject);
    //            if ([topLevelObject isKindOfClass: [self class]]) {
    //                ret = topLevelObject;
    //                break;
    //            }
    //        }
    //    }
    //
    //    if (self == nil) {
    //        NSLog(@"self was nil.");
    //
    //        self = [super initWithFrame: frameRect];
    //        if (self) {
    //
    //        }
    //    }

    return self;
}


- (Class) classForKeyedArchiver {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return [super classForKeyedArchiver];
}

- (id) replacementObjectForKeyedArchiver: (NSKeyedArchiver *) archiver {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return [super replacementObjectForKeyedArchiver: archiver];
}

- (Class) classForArchiver {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return [super classForArchiver];
}

- (id) replacementObjectForArchiver: (NSArchiver *) archiver {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return [super replacementObjectForArchiver: archiver];
}

- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {
        NSLog(@"%s", __PRETTY_FUNCTION__);

    }

    return self;
}

+ (void) load {
    [super load];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

+ (void) initialize {
    [super initialize];
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (id) init {
    self = [super init];
    if (self) {
        NSLog(@"%s", __PRETTY_FUNCTION__);

    }

    return self;
}


- (id) awakeAfterUsingCoder: (NSCoder *) aDecoder {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return [super awakeAfterUsingCoder: aDecoder];
}

- (void) awakeFromNib {
    [super awakeFromNib];
    NSLog(@"%s", __PRETTY_FUNCTION__);

}


@end