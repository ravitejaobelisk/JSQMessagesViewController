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
}

@end
