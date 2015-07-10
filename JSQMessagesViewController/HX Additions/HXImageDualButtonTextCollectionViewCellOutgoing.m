//
//  HXImageTextCollectionViewCellOutgoing.m
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 30/06/15.
//

#import "HXImageDualButtonTextCollectionViewCellOutgoing.h"

@implementation HXImageDualButtonTextCollectionViewCellOutgoing

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.messageBubbleTopLabel.textAlignment = NSTextAlignmentRight;
    self.cellBottomLabel.textAlignment = NSTextAlignmentRight;
}

@end
