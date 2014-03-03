//
// Created by Dani Postigo on 2/8/14.
// Copyright (c) 2014 Dani Postigo. All rights reserved.
//

#import <NSColor-Crayola/NSColor+Crayola.h>
#import <NSColor-BlendingUtils/NSColor+BlendingUtils.h>
#import "LogDetailCardCellView.h"
#import "NSView+DPKit.h"
#import "NSShadow+DPKit.h"

@implementation LogDetailCardCellView

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

- (id) initWithCoder: (NSCoder *) coder {
    self = [super initWithCoder: coder];
    if (self) {

        NSLog(@"%s", __PRETTY_FUNCTION__);

    }

    return self;
}


- (void) awakeFromNib {
    [super awakeFromNib];

    NSLog(@"self.objectValue = %@", self.objectValue);
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


@end