//
//  HXButtonTextCollectionViewCell.m
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 01/07/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "HXDualButtonTextCollectionViewCell.h"
#import "JSQMessagesCollectionViewLayoutAttributes.h"
#import "HXAdditions.h"

@interface HXDualButtonTextCollectionViewCell()
@property (nonatomic, weak) CALayer* tophairLine;
@property (nonatomic, weak) CALayer* middlehairLine;

@end

@implementation HXDualButtonTextCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.leftButton addTarget:self action:@selector(didTouchLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.rightButton addTarget:self action:@selector(didTouchRightButton:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonViewContainerSeparatorColor = [UIColor lightGrayColor];
}

- (void) dealloc {
    _extendedDelegate = nil;
    [self.leftButton removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
    [self.rightButton removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
}


- (void) setButtonViewContainerSeparatorColor:(UIColor *)buttonViewContainerSeparatorColor {
    _buttonViewContainerSeparatorColor = buttonViewContainerSeparatorColor;
    self.tophairLine.backgroundColor = self.buttonViewContainerSeparatorColor.CGColor;
    self.middlehairLine.backgroundColor = self.buttonViewContainerSeparatorColor.CGColor;
}


- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    
    JSQMessagesCollectionViewLayoutAttributes *customAttributes = (JSQMessagesCollectionViewLayoutAttributes *)layoutAttributes;
    
    //Top Button Container hair line
    CALayer* tophairLine = [CALayer layer];
    tophairLine.frame = CGRectMake(0, 0, customAttributes.messageBubbleContainerViewWidth, 0.5);
    tophairLine.backgroundColor = self.buttonViewContainerSeparatorColor.CGColor;
    [self.buttonViewContainer.layer addSublayer:tophairLine];
    self.tophairLine = tophairLine;
    
    //Top Button Container hair line
    CALayer* middlehairLine = [CALayer layer];
    middlehairLine.frame = CGRectMake(customAttributes.messageBubbleContainerViewWidth / 2, 0, 0.5, self.buttonViewContainer.bounds.size.height);
    middlehairLine.backgroundColor = self.buttonViewContainerSeparatorColor.CGColor;
    [self.buttonViewContainer.layer addSublayer:middlehairLine];
    self.middlehairLine = middlehairLine;
}

- (void) didTouchLeftButton:(UIButton*) sender {
    [self.extendedDelegate messagesCollectionViewCellDidTouchLeftButton:self];
}

- (void) didTouchRightButton: (UIButton*) sender {
    [self.extendedDelegate messagesCollectionViewCellDidTouchRightButton:self];
}

@end
