//
// Created by Dani Postigo on 3/3/14.
//

#import <NSColor-Crayola/NSColor+Crayola.h>
#import "BOUILoginController.h"
#import "BOUIModel.h"
#import "BOAPIModel+Utils.h"
#import "BOLoginOperation.h"

@implementation BOUILoginController

@synthesize userField;
@synthesize passwordField;

- (void) awakeFromNib {
    [super awakeFromNib];

    [self setupBackground];

    userField.stringValue = _model.apiModel.lastSuccessfulUsername == nil ? @"" : [_model.apiModel.lastSuccessfulUsername lowercaseString];
    passwordField.stringValue = _model.apiModel.lastPassword == nil ? @"" : _model.apiModel.lastPassword;

}

- (IBAction) submit: (id) sender {
    [_model.queue addOperation: [[BOLoginOperation alloc] initWithUsername: self.userValue password: self.passwordValue]];
}


- (void) setupBackground {

    self.view.wantsLayer = YES;

    CALayer *layer = self.view.layer;
    layer.backgroundColor = [NSColor controlColor].CGColor;
}

- (NSString *) userValue {
    return userField.stringValue;
}

- (NSString *) passwordValue {
    return passwordField.stringValue;
}
@end