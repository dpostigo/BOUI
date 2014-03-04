//
// Created by Dani Postigo on 3/3/14.
//

#import <Foundation/Foundation.h>
#import "BOUIViewController.h"

@interface BOUILoginController : BOUIViewController {

    IBOutlet NSTextField *userField;
    IBOutlet NSTextField *passwordField;
    IBOutlet NSButton *autoLoginCheckbox;
}

@property(nonatomic, strong) NSTextField *userField;
@property(nonatomic, strong) NSTextField *passwordField;
- (IBAction) submit: (id) sender;
@end