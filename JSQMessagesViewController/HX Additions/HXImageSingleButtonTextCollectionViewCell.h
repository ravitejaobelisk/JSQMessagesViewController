//
//  HXImageTextCollectionViewCell.h
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 30/06/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "JSQMessagesCollectionViewCell.h"
#import "UIRoundedCornersView.h"
#import "HXButtonTextCollectionViewCell.h"

@protocol HXCollectionViewCellDelegate;

@interface HXImageSingleButtonTextCollectionViewCell : HXButtonTextCollectionViewCell

@property (weak, nonatomic) IBOutlet UIRoundedCornersView*headerImageViewContainer;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;


@end
