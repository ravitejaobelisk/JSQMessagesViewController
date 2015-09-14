//
//  HXButtonTextCollectionViewCell.m
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 01/07/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "HXButtonTextCollectionViewCell.h"
#import "JSQMessagesCollectionViewLayoutAttributes.h"


@implementation HXButtonTextCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.button addTarget:self action:@selector(didTouchButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.button.titleLabel.adjustsFontSizeToFitWidth = true;
    self.button.titleLabel.minimumScaleFactor = 0.7;
}

- (void)dealloc {
    _extendedDelegate = nil;
    [self.button removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];
    
    JSQMessagesCollectionViewLayoutAttributes *customAttributes = (JSQMessagesCollectionViewLayoutAttributes *)layoutAttributes;
    
    //Top Button Container hair line
    CALayer* tophairLine = [CALayer layer];
    //CGFloat hairLineWidth = customAttributes.messageBubbleContainerViewWidth - (customAttributes.textViewTextContainerInsets.left + customAttributes.textViewTextContainerInsets.right);
    tophairLine.frame = CGRectMake(0, 0, customAttributes.messageBubbleContainerViewWidth, 0.5);
    tophairLine.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3].CGColor;
    [self.buttonViewContainer.layer addSublayer:tophairLine];
    
    //Shadow
//    self.messageBubbleContainerView.layer.shadowColor = [UIColor grayColor].CGColor;
//    self.messageBubbleContainerView.layer.shadowOpacity = 0.7f;
//    self.messageBubbleContainerView.layer.shadowOffset = CGSizeMake(0.0f, 1.0f);
//    self.messageBubbleContainerView.layer.shadowRadius = 0.5f;
//    self.messageBubbleContainerView.layer.masksToBounds = NO;
}

- (void) didTouchButton:(UIButton*) sender {
    [self.extendedDelegate messagesCollectionViewCellDidTouchButton:self];
}

@end