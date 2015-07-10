//
//  HXImageTextCollectionViewCellIncoming.m
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 30/06/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "HXImageDualButtonTextCollectionViewCellIncoming.h"

@implementation HXImageDualButtonTextCollectionViewCellIncoming

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.messageBubbleTopLabel.textAlignment = NSTextAlignmentLeft;
    self.cellBottomLabel.textAlignment = NSTextAlignmentLeft;
}

@end
