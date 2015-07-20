//
//  HXImageTextCollectionViewCell.m
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 30/06/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "HXImageDualButtonTextCollectionViewCell.h"


@implementation HXImageDualButtonTextCollectionViewCell

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.headerImageView.image = nil;
}


@end
