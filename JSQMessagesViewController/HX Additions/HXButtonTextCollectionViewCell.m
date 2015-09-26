//
//  HXButtonTextCollectionViewCell.m
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 01/07/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "HXButtonTextCollectionViewCell.h"
#import "JSQMessagesCollectionViewLayoutAttributes.h"

@interface HXButtonTextCollectionViewCell()
@property (nonatomic, weak) CALayer* tophairLine;

@end


@implementation HXButtonTextCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.button addTarget:self action:@selector(didTouchButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.buttonViewContainerSeparatorColor = [UIColor lightGrayColor];
    
    self.button.titleLabel.adjustsFontSizeToFitWidth = true;
    self.button.titleLabel.minimumScaleFactor = 0.7;
}

- (void)dealloc {
    _extendedDelegate = nil;
    [self.button removeTarget:nil action:NULL forControlEvents:UIControlEventAllEvents];
}

- (void) setButtonViewContainerSeparatorColor:(UIColor *)buttonViewContainerSeparatorColor {
    _buttonViewContainerSeparatorColor = buttonViewContainerSeparatorColor;
    self.tophairLine.backgroundColor = self.buttonViewContainerSeparatorColor.CGColor;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];
    
    JSQMessagesCollectionViewLayoutAttributes *customAttributes = (JSQMessagesCollectionViewLayoutAttributes *)layoutAttributes;
    NSLog(@"%f",customAttributes.messageBubbleContainerViewWidth);
    if (!self.tophairLine) {
        CALayer* tophairLine = [CALayer layer];
        tophairLine.frame = CGRectMake(0, 0, customAttributes.messageBubbleContainerViewWidth, 1);
        tophairLine.backgroundColor = self.buttonViewContainerSeparatorColor.CGColor;
        [self.buttonViewContainer.layer addSublayer:tophairLine];
        self.tophairLine = tophairLine;
    }
}

- (void) didTouchButton:(UIButton*) sender {
    [self.extendedDelegate messagesCollectionViewCellDidTouchButton:self];
}

@end