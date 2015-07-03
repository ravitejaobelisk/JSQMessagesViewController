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

@interface HXMessagesViewController()

@property (copy, nonatomic) NSString *outgoinImageTextCellIdentifier;
@property (copy, nonatomic) NSString *incomingImageTextCellIdentifier;

@property (copy, nonatomic) NSString *outgoingButtonTextCellIdentifier;
@property (copy, nonatomic) NSString *incomingButtonTextCellIdentifier;

@property (copy, nonatomic) NSString *outgoingDualButtonTextCellIdentifier;
@property (copy, nonatomic) NSString *incomingDualButtonTextCellIdentifier;

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


- (UICollectionViewCell *)collectionView:(JSQMessagesCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    id<JSQMessageData> messageItem = [collectionView.dataSource collectionView:collectionView messageDataForItemAtIndexPath:indexPath];
    
    if (![messageItem conformsToProtocol:@protocol(HXExtendedData)]) {
        return [super collectionView:collectionView cellForItemAtIndexPath:indexPath];
        
    } else {
        id <HXExtendedData> extendedMessageItem = (id <HXExtendedData>) messageItem;
        
        BOOL isOutgoingMessage = [[extendedMessageItem senderId] isEqualToString:self.senderId];
        
        NSString *cellIdentifier = nil;
        JSQMessagesCollectionViewCell *cell;
        
        switch ([extendedMessageItem messageType]) {
                
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
                [extendedCell.button addTarget:self action:@selector(didPressCellButton:) forControlEvents:UIControlEventTouchUpInside];
                extendedCell.button.tag = indexPath.item;
                break;
            }
                
            case HXExtendedDataMessageTypeAttributedTextDualButton: {
                cellIdentifier = isOutgoingMessage ? self.outgoingDualButtonTextCellIdentifier : self.incomingDualButtonTextCellIdentifier;
                cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
                HXDualButtonTextCollectionViewCell* extendedCell = (HXDualButtonTextCollectionViewCell*) cell;
                extendedCell.textView.attributedText = [extendedMessageItem attributedText];
               
                [extendedCell.rightButton setTitle:[extendedMessageItem titleForRightButton] forState:UIControlStateNormal];
                [extendedCell.rightButton addTarget:self action:@selector(didPressCellRightButton:) forControlEvents:UIControlEventTouchUpInside];
                extendedCell.rightButton.tag = indexPath.item;
                
                [extendedCell.leftButton setTitle:[extendedMessageItem titleForLeftButton] forState:UIControlStateNormal];
                [extendedCell.leftButton addTarget:self action:@selector(didPressCellLeftButton:) forControlEvents:UIControlEventTouchUpInside];
                extendedCell.leftButton.tag = indexPath.item;
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

- (void) didPressCellButton:(UIButton*) sender {
    NSIndexPath* cellIndexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
    NSLog(@"Press button at IndexPath: %@",cellIndexPath);
}

- (void) didPressCellRightButton:(UIButton*) sender {
    NSIndexPath* cellIndexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
    NSLog(@"Press right button at IndexPath: %@",cellIndexPath);
}

- (void) didPressCellLeftButton:(UIButton*) sender {
    NSIndexPath* cellIndexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
    NSLog(@"Press left button at IndexPath: %@",cellIndexPath);
}


@end
