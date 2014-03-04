//
// Created by Dani Postigo on 2/8/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <NSColor-Crayola/NSColor+Crayola.h>
#import <NSColor-BlendingUtils/NSColor+BlendingUtils.h>
#import <NSView-NewConstraints/NSView+NewConstraint.h>
#import "LogDetailCardCellView.h"
#import "NSView+DPKit.h"
#import "NSShadow+DPKit.h"
#import "DPControllerComboBox.h"
#import "NSView+ConstraintGetters.h"
#import "NSView+NewConstraint.h"
#import "NSLayoutConstraint+DPUtils.h"
#import "NSView+ConstraintFinders.h"
#import "BOAPIModel.h"
#import "DPUnderlineComboBoxCell.h"

@implementation LogDetailCardCellView

@synthesize noteField;
@synthesize serviceField;
@synthesize serviceComboBox;

- (id) initWithFrame: (NSRect) frameRect {
    self = [self loadFromNib: [self className]];
    if (self == nil) {
        self = [super initWithFrame: frameRect];
        if (self) {

        }
    }

    return self;
}


+ (NSColor *) cellBackgroundColor {
    return [NSColor crayolaCoconutColor];
}


- (void) awakeFromNib {
    [super awakeFromNib];

    [self setupBackground];
}

- (void) setupBackground {
    self.wantsLayer = YES;

    CALayer *layer = self.layer;
    layer.backgroundColor = [[self class] cellBackgroundColor].CGColor;
    layer.masksToBounds = NO;

    self.shadow = [NSShadow shadowWithColor: [NSColor blackColor] radius: 1.0 offset: NSMakeSize(0, -1)];

    layer.shadowColor = [NSColor blackColor].CGColor;
    layer.shadowRadius = 1.0;
    layer.shadowOffset = NSMakeSize(0, -1);

    layer.cornerRadius = 5.0;

    layer.borderColor = [NSColor lighten: [[self class] cellBackgroundColor] amount: 0.5].CGColor;
    layer.borderWidth = 0.5;

}


- (void) modify {

    //    NSRect rect = serviceField.frame;
    //    //    rect.origin.x += 5;
    //
    //    serviceComboBox = [[DPControllerComboBox alloc] initWithFrame: rect];
    //    //    [serviceComboBox setCell: [[DPUnderlineComboBoxCell alloc] init]];
    //    [serviceComboBox setButtonBordered: NO];
    //    serviceComboBox.focusRingType = NSFocusRingTypeNone;


    [serviceComboBox.controller setContent: [BOAPIModel sharedModel].serviceItems];
    [serviceComboBox bind: @"contentValues" toObject: serviceComboBox.controller withKeyPath: @"arrangedObjects.title" options: nil];
    serviceComboBox.font = noteField.font;
    serviceComboBox.textColor = noteField.textColor;

}

@end