//
//  NSObject+BackgroundLayer.m
//  JSQMessages
//
//  Created by Nineleaps on 3/21/16.
//  Copyright © 2016 Hexed Bits. All rights reserved.
//

#import "NSObject+BackgroundLayer.h"
#import <UIKit/UIKit.h>

@implementation NSObject (BackgroundLayer)

+ (CAGradientLayer*) greyGradientForRightView {
    UIColor *colorOne = [UIColor colorWithRed:(204/255.0) green:(210/255.0) blue:(215/255.0) alpha:0.6];
    
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    headerLayer.startPoint = CGPointMake(0, 0.5);
    headerLayer.endPoint = CGPointMake(1.0, 0.5);
    headerLayer.colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, (id)[[UIColor clearColor] CGColor], nil];
    
    return headerLayer;
    
}

+ (CAGradientLayer*) greyGradientForLeftView {
    UIColor *colorOne = [UIColor colorWithRed:(204/255.0) green:(210/255.0) blue:(215/255.0) alpha:0.6];
    
    CAGradientLayer *headerLayer = [CAGradientLayer layer];
    headerLayer.startPoint = CGPointMake(1.0, 0.5);
    headerLayer.endPoint = CGPointMake(0, 0.5);
    headerLayer.colors = [NSArray arrayWithObjects:(id)colorOne.CGColor, (id)[[UIColor clearColor] CGColor], nil];
    
    return headerLayer;
    
}
@end
