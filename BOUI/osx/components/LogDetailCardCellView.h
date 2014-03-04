//
// Created by Dani Postigo on 2/8/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DPTableCellView.h"

@class DPControllerComboBox;

@interface LogDetailCardCellView : DPTableCellView {

    IBOutlet NSTextField *noteField;
    IBOutlet NSTextField *serviceField;
    IBOutlet DPControllerComboBox *serviceComboBox;
}

@property(nonatomic, strong) NSTextField *noteField;
@property(nonatomic, strong) NSTextField *serviceField;
@property(nonatomic, strong) DPControllerComboBox *serviceComboBox;
+ (NSColor *) cellBackgroundColor;
- (void) modify;
@end