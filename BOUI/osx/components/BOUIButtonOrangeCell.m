//
// Created by Dani Postigo on 2/28/14.
//

#import <NSColor-Crayola/NSColor+Crayola.h>
#import "BOUIButtonOrangeCell.h"
#import "NSColor+BlendingUtils.h"
#import "NSColor+Hex.h"

@implementation BOUIButtonOrangeCell

- (void) setupColors {
    [super setupColors];

    buttonBorderColor = [NSColor colorWithDeviceWhite: 0.0 alpha: 0.4];

    NSColor *topColor = [NSColor colorWithString: @"FDBE6D"];
    NSColor *bottomColor = [[topColor mix: [NSColor crayolaBrickRedColor] fraction: 0.2] darken: 0.2];
    self.buttonGradient = [[NSGradient alloc] initWithStartingColor: bottomColor endingColor: topColor];

    buttonTitleShadow.shadowColor = [topColor lighten: 0.5];
    //    buttonTitleShadow.shadowBlurRadius = 0.5;
    buttonTitleShadow.shadowOffset = NSMakeSize(0.0, -1);
}

@end