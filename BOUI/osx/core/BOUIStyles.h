//
// Created by Dani Postigo on 1/22/14.
// Copyright (c) 2014 Elastic Creative. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface BOUIStyles : NSObject {

}

+ (NSColor *) onyxHighlightColor;
+ (NSShadow *) defaultShadow;
+ (NSShadow *) defaultShadowWithRadius: (CGFloat) radius;
+ (NSShadow *) defaultShadowWithRadius: (CGFloat) radius offset: (NSSize) offset;
+ (NSShadow *) shadowWithColor: (NSColor *) color radius: (CGFloat) radius offset: (NSSize) offset;
+ (CAGradientLayer *) defaultGradientLayer;
+ (void) addDefaultGradient: (CALayer *) layer;
@end