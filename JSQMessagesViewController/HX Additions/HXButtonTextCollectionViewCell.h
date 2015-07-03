//
//  HXButtonTextCollectionViewCell.h
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 01/07/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "JSQMessagesCollectionViewCell.h"

@interface HXButtonTextCollectionViewCell : JSQMessagesCollectionViewCell

@property (weak, nonatomic) IBOutlet UIView *buttonViewContainer;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end
