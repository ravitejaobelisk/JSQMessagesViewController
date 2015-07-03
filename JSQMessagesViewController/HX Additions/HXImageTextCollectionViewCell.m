//
//  HXImageTextCollectionViewCell.m
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 30/06/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "HXImageTextCollectionViewCell.h"

@implementation HXImageTextCollectionViewCell

- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    UIBezierPath* maskPath = [UIBezierPath bezierPathWithRoundedRect:self.headerImageViewContainer.bounds
                                                   byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)
                                                         cornerRadii:CGSizeMake(15.0, 15.0)];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.headerImageViewContainer.bounds;
    maskLayer.path = maskPath.CGPath;
    self.headerImageViewContainer.layer.mask = maskLayer;
    
    //Shadow
    self.messageBubbleContainerView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.messageBubbleContainerView.layer.shadowOpacity = 0.7f;
    self.messageBubbleContainerView.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    self.messageBubbleContainerView.layer.shadowRadius = 0.5f;
    self.messageBubbleContainerView.layer.masksToBounds = NO;
    
    NSLog(@"preferredLayoutAttributesFittingAttributes - messageBubbleContainerView: %@", NSStringFromCGRect(self.messageBubbleContainerView.frame));
    NSLog(@"preferredLayoutAttributesFittingAttributes - headerImageViewContainer: %@", NSStringFromCGRect(self.headerImageViewContainer.frame));
    NSLog(@"preferredLayoutAttributesFittingAttributes - textView: %@", NSStringFromCGRect(self.textView.frame));
    
    return [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
}

@end
