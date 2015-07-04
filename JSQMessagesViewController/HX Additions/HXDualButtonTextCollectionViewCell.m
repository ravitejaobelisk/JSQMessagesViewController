//
//  HXButtonTextCollectionViewCell.m
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 01/07/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "HXDualButtonTextCollectionViewCell.h"
#import "JSQMessagesCollectionViewLayoutAttributes.h"


@implementation HXDualButtonTextCollectionViewCell

- (void) prepareForReuse {
    [super prepareForReuse];
    [self.rightButton removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
    [self.leftButton removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    
    JSQMessagesCollectionViewLayoutAttributes *customAttributes = (JSQMessagesCollectionViewLayoutAttributes *)layoutAttributes;
    
    //Top Button Container hair line
    CALayer* tophairLine = [CALayer layer];
    tophairLine.frame = CGRectMake(0, 0, customAttributes.messageBubbleContainerViewWidth, 0.5);
    tophairLine.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2].CGColor;
    [self.buttonViewContainer.layer addSublayer:tophairLine];
    
    //Top Button Container hair line
    CALayer* middlehairLine = [CALayer layer];
    middlehairLine.frame = CGRectMake(customAttributes.messageBubbleContainerViewWidth / 2, 0, 0.5, self.buttonViewContainer.bounds.size.height);
    middlehairLine.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2].CGColor;
    [self.buttonViewContainer.layer addSublayer:middlehairLine];
}

@end
