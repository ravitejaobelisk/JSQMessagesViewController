//
//  HXButtonTextCollectionViewCellIncoming.m
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 01/07/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "HXSystemCollectionViewCell.h"
@import QuartzCore;

@implementation HXSystemCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.messageBubbleTopLabel.textAlignment = NSTextAlignmentCenter;
    self.cellBottomLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    [super applyLayoutAttributes:layoutAttributes];
    self.textView.layer.cornerRadius = 10.0f;
}

@end
