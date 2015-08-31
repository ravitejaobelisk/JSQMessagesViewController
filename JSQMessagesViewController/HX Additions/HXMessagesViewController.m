//
//  HXMessagesViewController.m
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 30/06/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "HXMessagesViewController.h"

#import "JSQMessages.h"
#import "HXAdditions.h"
#import "DemoButtonMessage.h"
#import "DemoDualButtonMesssage.h"

@interface HXMessagesViewController()

@property (copy, nonatomic) NSString *outgoinImageTextCellIdentifier;
@property (copy, nonatomic) NSString *incomingImageTextCellIdentifier;

@property (copy, nonatomic) NSString *outgoingButtonTextCellIdentifier;
@property (copy, nonatomic) NSString *incomingButtonTextCellIdentifier;

@property (copy, nonatomic) NSString *outgoingDualButtonTextCellIdentifier;
@property (copy, nonatomic) NSString *incomingDualButtonTextCellIdentifier;

@property (copy, nonatomic) NSString *outgoingImageDualButtonTextCellIdentifier;
@property (copy, nonatomic) NSString *incomingImageDualButtonTextCellIdentifier;

@property (copy, nonatomic) NSString *systemCellIdentifier;

@end


@implementation HXMessagesViewController

+ (UINib *)nib
{
    return [UINib nibWithNibName:NSStringFromClass([HXMessagesViewController class])
                          bundle:[NSBundle bundleForClass:[HXMessagesViewController class]]];
}

+ (instancetype)messagesViewController
{
    return [[[self class] alloc] initWithNibName:NSStringFromClass([HXMessagesViewController class])
                                          bundle:[NSBundle bundleForClass:[HXMessagesViewController class]]];
}


- (void) viewDidLoad {
    [super viewDidLoad];
    [self registerHXImageTextCell];
    [self registerHXButtonTextCell];
    [self registerDualHXButtonTextCell];
    [self registerImageDualHXButtonTextCell];
    [self registerSystemCell];
}

- (void) registerSystemCell {
    self.systemCellIdentifier = [HXSystemCollectionViewCell cellReuseIdentifier];
    [self.collectionView registerNib:[HXSystemCollectionViewCell nib]
          forCellWithReuseIdentifier:self.systemCellIdentifier];
}


- (void) registerHXImageTextCell {
    self.outgoinImageTextCellIdentifier = [HXImageTextCollectionViewCellOutgoing cellReuseIdentifier];
    self.incomingImageTextCellIdentifier = [HXImageTextCollectionViewCellIncoming cellReuseIdentifier];
    
    [self.collectionView registerNib:[HXImageTextCollectionViewCellOutgoing nib]
          forCellWithReuseIdentifier: self.outgoinImageTextCellIdentifier];
    
    [self.collectionView registerNib:[HXImageTextCollectionViewCellIncoming nib]
          forCellWithReuseIdentifier:self.incomingImageTextCellIdentifier];
}


- (void) registerHXButtonTextCell {
    self.outgoingButtonTextCellIdentifier = [HXButtonTextCollectionViewCellOutgoing cellReuseIdentifier];
    self.incomingButtonTextCellIdentifier = [HXButtonTextCollectionViewCellIncoming cellReuseIdentifier];
    
    [self.collectionView registerNib:[HXButtonTextCollectionViewCellOutgoing nib]
          forCellWithReuseIdentifier: self.outgoingButtonTextCellIdentifier];
    
    [self.collectionView registerNib:[HXButtonTextCollectionViewCellIncoming nib]
          forCellWithReuseIdentifier:self.incomingButtonTextCellIdentifier];
}

- (void) registerDualHXButtonTextCell {
    self.outgoingDualButtonTextCellIdentifier = [HXDualButtonTextCollectionViewCellOutgoing cellReuseIdentifier];
    self.incomingDualButtonTextCellIdentifier = [HXDualButtonTextCollectionViewCellIncoming cellReuseIdentifier];
    
    [self.collectionView registerNib:[HXDualButtonTextCollectionViewCellOutgoing nib]
          forCellWithReuseIdentifier: self.outgoingDualButtonTextCellIdentifier];
    
    [self.collectionView registerNib:[HXDualButtonTextCollectionViewCellIncoming nib]
          forCellWithReuseIdentifier:self.incomingDualButtonTextCellIdentifier];
}

- (void) registerImageDualHXButtonTextCell {
    self.outgoingImageDualButtonTextCellIdentifier = [HXImageDualButtonTextCollectionViewCellOutgoing cellReuseIdentifier];
    self.incomingImageDualButtonTextCellIdentifier = [HXImageDualButtonTextCollectionViewCellIncoming cellReuseIdentifier];
    
    [self.collectionView registerNib:[HXImageDualButtonTextCollectionViewCellOutgoing nib]
          forCellWithReuseIdentifier: self.outgoingImageDualButtonTextCellIdentifier];
    
    [self.collectionView registerNib:[HXImageDualButtonTextCollectionViewCellIncoming nib]
          forCellWithReuseIdentifier:self.incomingImageDualButtonTextCellIdentifier];
}


- (UICollectionViewCell *)collectionView:(JSQMessagesCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    id<JSQMessageData> messageItem = [collectionView.dataSource collectionView:collectionView messageDataForItemAtIndexPath:indexPath];
    
    if (![messageItem conformsToProtocol:@protocol(HXExtendedData)]) {
        JSQMessagesCollectionViewCell *cell = (JSQMessagesCollectionViewCell*) [super collectionView:collectionView cellForItemAtIndexPath:indexPath];
        cell.textView.dataDetectorTypes = UIDataDetectorTypeNone;
        return cell;
        
    } else {
        id <HXExtendedData> extendedMessageItem = (id <HXExtendedData>) messageItem;
        
        BOOL isOutgoingMessage = [[extendedMessageItem senderId] isEqualToString:self.senderId];
        
        NSString *cellIdentifier = nil;
        JSQMessagesCollectionViewCell *cell;
        
        switch ([extendedMessageItem messageType]) {
                
            case HXExtendedDataMessageTypeSystem: {
                cellIdentifier = self.systemCellIdentifier;
                cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
                cell.textView.attributedText = [extendedMessageItem attributedText];
                break;
            }
                
            case HXExtendedDataMessageTypeAttributedText: {
                cellIdentifier = isOutgoingMessage ? self.outgoingCellIdentifier : self.incomingCellIdentifier;
                cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
                cell.textView.attributedText = [extendedMessageItem attributedText];
                break;
            }
                
            case HXExtendedDataMessageTypeAttributedTextHeaderImage: {
                cellIdentifier = isOutgoingMessage ? self.outgoinImageTextCellIdentifier : self.incomingImageTextCellIdentifier;
                cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
                HXImageTextCollectionViewCell* extendedCell = (HXImageTextCollectionViewCell*) cell;
                extendedCell.textView.attributedText = [extendedMessageItem attributedText];
                extendedCell.headerImageView.image = [extendedMessageItem image];
                break;
            }
                
            case HXExtendedDataMessageTypeAttributedTextSingleButton: {
                cellIdentifier = isOutgoingMessage ? self.outgoingButtonTextCellIdentifier : self.incomingButtonTextCellIdentifier;
                cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
                HXButtonTextCollectionViewCell* extendedCell = (HXButtonTextCollectionViewCell*) cell;
                extendedCell.textView.attributedText = [extendedMessageItem attributedText];
                [extendedCell.button setTitle:[extendedMessageItem titleForButton] forState:UIControlStateNormal];
                extendedCell.extendedDelegate = self;
                break;
            }
                
            case HXExtendedDataMessageTypeAttributedTextDualButton: {
                cellIdentifier = isOutgoingMessage ? self.outgoingDualButtonTextCellIdentifier : self.incomingDualButtonTextCellIdentifier;
                cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
                HXDualButtonTextCollectionViewCell* extendedCell = (HXDualButtonTextCollectionViewCell*) cell;
                extendedCell.textView.attributedText = [extendedMessageItem attributedText];
                [extendedCell.leftButton setTitle:[extendedMessageItem titleForLeftButton] forState:UIControlStateNormal];
                [extendedCell.rightButton setTitle:[extendedMessageItem titleForRightButton] forState:UIControlStateNormal];
                extendedCell.extendedDelegate = self;
                break;
            }
                
            case HXExtendedDataMessageTypeAttributedTextHeaderImageDualButton: {
                cellIdentifier = isOutgoingMessage ? self.outgoingImageDualButtonTextCellIdentifier : self.incomingImageDualButtonTextCellIdentifier;
                cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
                HXImageDualButtonTextCollectionViewCell* extendedCell = (HXImageDualButtonTextCollectionViewCell*) cell;
                extendedCell.headerImageView.image = [extendedMessageItem image];
                extendedCell.textView.attributedText = [extendedMessageItem attributedText];
                [extendedCell.leftButton setTitle:[extendedMessageItem titleForLeftButton] forState:UIControlStateNormal];
                [extendedCell.rightButton setTitle:[extendedMessageItem titleForRightButton] forState:UIControlStateNormal];
                extendedCell.extendedDelegate = self;
                break;
            }
        }
        
        cell.delegate = collectionView;
        
        id<JSQMessageBubbleImageDataSource> bubbleImageDataSource = [collectionView.dataSource collectionView:collectionView messageBubbleImageDataForItemAtIndexPath:indexPath];
        if (bubbleImageDataSource != nil) {
            cell.messageBubbleImageView.image = [bubbleImageDataSource messageBubbleImage];
            cell.messageBubbleImageView.highlightedImage = [bubbleImageDataSource messageBubbleHighlightedImage];
        }
        
        NSParameterAssert(cell.textView.text != nil);
        
        BOOL needsAvatar = YES;
        if (isOutgoingMessage && CGSizeEqualToSize(collectionView.collectionViewLayout.outgoingAvatarViewSize, CGSizeZero)) {
            needsAvatar = NO;
        }
        else if (!isOutgoingMessage && CGSizeEqualToSize(collectionView.collectionViewLayout.incomingAvatarViewSize, CGSizeZero)) {
            needsAvatar = NO;
        }
        
        id<JSQMessageAvatarImageDataSource> avatarImageDataSource = nil;
        if (needsAvatar) {
            avatarImageDataSource = [collectionView.dataSource collectionView:collectionView avatarImageDataForItemAtIndexPath:indexPath];
            if (avatarImageDataSource != nil) {
                
            UIImage *avatarImage = [avatarImageDataSource avatarImage];
            if (avatarImage == nil) {
                cell.avatarImageView.image = [avatarImageDataSource avatarPlaceholderImage];
                    cell.avatarImageView.highlightedImage = nil;
                }
                else {
                    cell.avatarImageView.image = avatarImage;
                    cell.avatarImageView.highlightedImage = [avatarImageDataSource avatarHighlightedImage];
                }
            }
        }
        
        cell.cellTopLabel.attributedText = [collectionView.dataSource collectionView:collectionView attributedTextForCellTopLabelAtIndexPath:indexPath];
        cell.messageBubbleTopLabel.attributedText = [collectionView.dataSource collectionView:collectionView attributedTextForMessageBubbleTopLabelAtIndexPath:indexPath];
        cell.cellBottomLabel.attributedText = [collectionView.dataSource collectionView:collectionView attributedTextForCellBottomLabelAtIndexPath:indexPath];
        
        CGFloat bubbleTopLabelInset = (avatarImageDataSource != nil) ? 60.0f : 15.0f;
        
        if (isOutgoingMessage) {
            cell.messageBubbleTopLabel.textInsets = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, bubbleTopLabelInset);
        }
        else {
            cell.messageBubbleTopLabel.textInsets = UIEdgeInsetsMake(0.0f, bubbleTopLabelInset, 0.0f, 0.0f);
        }
        
        cell.textView.dataDetectorTypes = UIDataDetectorTypeNone;
        
        cell.backgroundColor = [UIColor clearColor];
        cell.layer.rasterizationScale = [UIScreen mainScreen].scale;
        cell.layer.shouldRasterize = YES;
        cell.clipsToBounds = NO;
        
        return cell;
    }
}

#pragma mark - HXCollectionViewCellDelegate

- (void) messagesCollectionViewCellDidTouchButton:(HXButtonTextCollectionViewCell*) cell {
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    if (indexPath == nil) {
        return;
    }
    
    HXExtendedMessage* extendedMessage = (HXExtendedMessage*) [self.collectionView.dataSource collectionView:self.collectionView messageDataForItemAtIndexPath:indexPath];
    if ([extendedMessage isKindOfClass:[DemoButtonMessage class]]) {
        DemoButtonMessage* message = (DemoButtonMessage*) extendedMessage;
        message.answered = YES;
        [self.collectionView.collectionViewLayout invalidateLayoutWithContext:[JSQMessagesCollectionViewFlowLayoutInvalidationContext context]];
        [self.collectionView reloadData];
    }
    NSLog(@"Did Press button at IndexPath: %@",indexPath);
}


- (void) messagesCollectionViewCellDidTouchLeftButton:(HXDualButtonTextCollectionViewCell*) cell {
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    if (indexPath == nil) {
        return;
    }
    NSLog(@"Did Press Left button at IndexPath: %@",indexPath);
}


- (void) messagesCollectionViewCellDidTouchRightButton:(HXDualButtonTextCollectionViewCell*) cell {
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    if (indexPath == nil) {
        return;
    }
    NSLog(@"Did Press Right button at IndexPath: %@",indexPath);
}


@end
