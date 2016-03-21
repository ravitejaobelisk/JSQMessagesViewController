//
//  NSObject+BackgroundLayer.h
//  JSQMessages
//
//  Created by Nineleaps on 3/21/16.
//  Copyright © 2016 Hexed Bits. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>


@interface NSObject (BackgroundLayer)

+(CAGradientLayer*) greyGradientForLeftView;
+(CAGradientLayer*) greyGradientForRightView;

@end
