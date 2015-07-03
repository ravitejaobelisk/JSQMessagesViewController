//
//  HXButtonTextCollectionViewCellOutgoing.m
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 01/07/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "HXButtonTextCollectionViewCellOutgoing.h"

@implementation HXButtonTextCollectionViewCellOutgoing
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.messageBubbleTopLabel.textAlignment = NSTextAlignmentRight;
    self.cellBottomLabel.textAlignment = NSTextAlignmentRight;
}
@end
