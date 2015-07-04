//
//  UIRoundedCornersView.h
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 04/07/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface UIRoundedCornersView : UIView

@property (nonatomic, assign) IBInspectable BOOL topLeftCorner;
@property (nonatomic, assign) IBInspectable BOOL topRightCorner;
@property (nonatomic, assign) IBInspectable BOOL bottomLeftCorner;
@property (nonatomic, assign) IBInspectable BOOL bottomRightCorner;

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

@end
