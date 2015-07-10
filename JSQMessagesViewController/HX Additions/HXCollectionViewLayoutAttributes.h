//
//  HXCollectionViewLayoutAttributes.h
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 10/07/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "JSQMessagesCollectionViewLayoutAttributes.h"

@interface HXCollectionViewLayoutAttributes : JSQMessagesCollectionViewLayoutAttributes

/**
 *  The height of the `messageBubbleContainerView` of a `JSQMessagesCollectionViewCell`.
 *  This value should be greater than `0.0`.
 *
 *  @see JSQMessagesCollectionViewCell.
 */
@property (assign, nonatomic) CGFloat messageBubbleContainerViewHeight;

@end
