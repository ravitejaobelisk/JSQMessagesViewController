//
//  HXImageTextCollectionViewCell.m
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 30/06/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "HXImageTextCollectionViewCell.h"
#import "JSQMessagesCollectionViewLayoutAttributes.h"

@implementation HXImageTextCollectionViewCell

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.headerImageView = nil;
    self.headerImageViewContainer.layer.mask = nil;
}


- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    
    JSQMessagesCollectionViewLayoutAttributes *customAttributes = (JSQMessagesCollectionViewLayoutAttributes *)[super preferredLayoutAttributesFittingAttributes:layoutAttributes];

    
    //Não FUNCIONA ESTA MERDA - TIVE QUE BOTAR UMA VIEW PARA ESCONDE O cornerRadius EM BAIXO
//    UIBezierPath* maskPath = [UIBezierPath bezierPathWithRoundedRect:self.headerImageViewContainer.bounds
//                                                   byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)
//                                                         cornerRadii:CGSizeMake(15.0, 15.0)];
//    
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    CGRect frame = self.headerImageViewContainer.bounds;
//    frame.size.width = customAttributes.messageBubbleContainerViewWidth;
//    maskLayer.frame = frame; //self.headerImageViewContainer.bounds;
//    maskLayer.path = maskPath.CGPath;
//    self.headerImageViewContainer.frame = frame;
//    self.headerImageViewContainer.layer.mask = maskLayer;
    
    self.headerImageViewContainer.layer.cornerRadius = 15.0f;
    
    //Shadow
    self.messageBubbleContainerView.layer.shadowColor = [UIColor grayColor].CGColor;
    self.messageBubbleContainerView.layer.shadowOpacity = 0.7f;
    self.messageBubbleContainerView.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
    self.messageBubbleContainerView.layer.shadowRadius = 0.5f;
    self.messageBubbleContainerView.layer.masksToBounds = NO;
    
    return customAttributes;
}


@end
