//
//  HXButtonTextCollectionViewCell.h
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 01/07/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "JSQMessagesCollectionViewCell.h"
#import "HXCollectionViewCellDelegate.h"

@interface HXButtonTextCollectionViewCell : JSQMessagesCollectionViewCell

// Default is [UIColor lightGrayColor];
@property (strong, nonatomic) UIColor* buttonViewContainerSeparatorColor;

@property (weak, nonatomic) IBOutlet UIView *buttonViewContainer;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) id<HXCollectionViewCellDelegate> extendedDelegate;

@end
