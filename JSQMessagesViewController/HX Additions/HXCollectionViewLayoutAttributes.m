//
//  HXCollectionViewLayoutAttributes.m
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 10/07/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "HXCollectionViewLayoutAttributes.h"

@implementation HXCollectionViewLayoutAttributes

#pragma mark - Setters

- (void)setMessageBubbleContainerViewHeight:(CGFloat)messageBubbleContainerViewHeight
{
    NSParameterAssert(messageBubbleContainerViewHeight > 0.0f);
    _messageBubbleContainerViewHeight = ceilf(messageBubbleContainerViewHeight);
}

- (BOOL)isEqual:(id)object
{
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    
    if (self.representedElementCategory == UICollectionElementCategoryCell) {
        HXCollectionViewLayoutAttributes *layoutAttributes = (HXCollectionViewLayoutAttributes *)object;
        if ((int)layoutAttributes.messageBubbleContainerViewHeight != (int)self.messageBubbleContainerViewHeight)
        {
            return NO;
        }
    }
    
    return [super isEqual:object];
}

#pragma mark - NSCopying

- (instancetype)copyWithZone:(NSZone *)zone
{
    HXCollectionViewLayoutAttributes *copy = [super copyWithZone:zone];
    
    if (copy.representedElementCategory != UICollectionElementCategoryCell) {
        return copy;
    }
    
    copy.messageBubbleContainerViewHeight = self.messageBubbleContainerViewHeight;
    return copy;
}


@end
