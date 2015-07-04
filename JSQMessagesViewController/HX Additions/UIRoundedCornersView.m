//
//  UIRoundedCornersView.m
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 04/07/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "UIRoundedCornersView.h"

@interface UIRoundedCornersView()
@property (nonatomic, weak) CAShapeLayer* maskLayer;
@end

@implementation UIRoundedCornersView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self configView];
    }
    return self;
}

- (void) configView {
    _topLeftCorner = YES;
    _topRightCorner = YES;
    _bottomLeftCorner = YES;
    _bottomRightCorner = YES;
    _cornerRadius = 15.0f;
}


- (void) layoutSubviews {
    UIRectCorner rectCorner = 0;
    rectCorner = (self.topLeftCorner) ? rectCorner | UIRectCornerTopLeft : rectCorner;
    rectCorner = (self.topRightCorner) ? rectCorner | UIRectCornerTopRight : rectCorner;
    rectCorner = (self.bottomLeftCorner) ? rectCorner | UIRectCornerBottomLeft : rectCorner;
    rectCorner = (self.bottomRightCorner) ? rectCorner | UIRectCornerBottomRight : rectCorner;
    
    UIBezierPath* maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                   byRoundingCorners:rectCorner
                                                         cornerRadii:CGSizeMake(self.cornerRadius, self.cornerRadius)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

@end
