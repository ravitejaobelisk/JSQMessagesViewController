//
//  HXButtonTextCollectionViewCell.h
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 01/07/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "JSQMessagesCollectionViewCell.h"

@protocol HXCollectionViewCellDelegate;

@interface HXDualButtonTextCollectionViewCell : JSQMessagesCollectionViewCell

@property (weak, nonatomic) IBOutlet UIView *buttonViewContainer;

@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@property (weak, nonatomic) id<HXCollectionViewCellDelegate> extendedDelegate;

@end
