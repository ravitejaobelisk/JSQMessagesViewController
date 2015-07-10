//
//  HXCollectionViewFlowLayout.m
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 01/07/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "HXCollectionViewFlowLayout.h"
#import "HXAdditions.h"
#import "UIImage+JSQMessages.h"
#import "HXCollectionViewLayoutAttributes.h"

@interface HXCollectionViewFlowLayout()

@property (strong, nonatomic) NSCache *messageBubbleCache;
@property (assign, nonatomic, readonly) NSUInteger bubbleImageAssetWidth;

@end

@implementation HXCollectionViewFlowLayout

- (instancetype)init {
    self = [super init];
    if (self) {
        [self config];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    [self config];
}


- (void)config {
    _bubbleImageAssetWidth = [UIImage jsq_bubbleCompactImage].size.width;
    
    self.incomingAvatarViewSize = CGSizeZero;
    self.outgoingAvatarViewSize = CGSizeZero;
    
    _messageBubbleCache = [NSCache new];
    _messageBubbleCache.name = @"JSQMessagesCollectionViewFlowLayout.messageBubbleCache";
    _messageBubbleCache.countLimit = 200;
}

+ (Class)layoutAttributesClass
{
    return [HXCollectionViewLayoutAttributes class];
}


- (CGSize)messageBubbleSizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    id<JSQMessageData> messageItem = [self.collectionView.dataSource collectionView:self.collectionView messageDataForItemAtIndexPath:indexPath];
    
    NSValue *cachedSize = [self.messageBubbleCache objectForKey:@([messageItem messageHash])];
    if (cachedSize != nil) {
        return [cachedSize CGSizeValue];
    }
    
    CGSize finalSize = CGSizeZero;
    
    if ([messageItem isMediaMessage]) {
        finalSize = [[messageItem media] mediaViewDisplaySize];
    }
    else {
        CGSize avatarSize = CGSizeZero;// [self jsq_avatarSizeForIndexPath:indexPath];
        
        //  from the cell xibs, there is a 2 point space between avatar and bubble
        CGFloat spacingBetweenAvatarAndBubble = 2.0f;
        CGFloat horizontalContainerInsets = self.messageBubbleTextViewTextContainerInsets.left + self.messageBubbleTextViewTextContainerInsets.right;
        CGFloat horizontalFrameInsets = self.messageBubbleTextViewFrameInsets.left + self.messageBubbleTextViewFrameInsets.right;
        
        CGFloat horizontalInsetsTotal = horizontalContainerInsets + horizontalFrameInsets + spacingBetweenAvatarAndBubble;
        CGFloat maximumTextWidth = self.itemWidth - avatarSize.width - self.messageBubbleLeftRightMargin - horizontalInsetsTotal;
        
        CGRect  stringRect;
        CGFloat accessoriesHeight = 0.0f;
        CGFloat accessoriesWidth = 0.0f;
        
        if ([messageItem conformsToProtocol:@protocol(HXExtendedData)]) {
            id <HXExtendedData> extendedMessageItem = (id <HXExtendedData>) messageItem;
            stringRect = [[extendedMessageItem attributedText] boundingRectWithSize:CGSizeMake(maximumTextWidth, CGFLOAT_MAX)
                                                                            options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                                                            context:nil];
            
            switch ([extendedMessageItem messageType]) {
                    
                case HXExtendedDataMessageTypeAttributedTextHeaderImage:
                    accessoriesHeight = 170;
                    accessoriesWidth = 170;
                    break;
                
                case HXExtendedDataMessageTypeAttributedTextDualButton:
                case HXExtendedDataMessageTypeAttributedTextSingleButton: {
                    accessoriesHeight = 44;
                    CGRect buttonRect = [[extendedMessageItem titleForButton] boundingRectWithSize:CGSizeMake(maximumTextWidth, CGFLOAT_MAX)
                                                                                           options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                                                                        attributes:@{ NSFontAttributeName : self.messageBubbleFont }
                                                                                           context:nil];
                    accessoriesWidth = buttonRect.size.width;
                    
                    break;
                }
                    
                default: break;
            }
            
        } else {
            stringRect = [[messageItem text] boundingRectWithSize:CGSizeMake(maximumTextWidth, CGFLOAT_MAX)
                                                          options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                                       attributes:@{ NSFontAttributeName : self.messageBubbleFont }
                                                          context:nil];
        }
        
        CGSize stringSize = CGRectIntegral(stringRect).size;
        
        CGFloat verticalContainerInsets = self.messageBubbleTextViewTextContainerInsets.top + self.messageBubbleTextViewTextContainerInsets.bottom;
        CGFloat verticalFrameInsets = self.messageBubbleTextViewFrameInsets.top + self.messageBubbleTextViewFrameInsets.bottom;
        
        //  add extra 2 points of space, because `boundingRectWithSize:` is slightly off
        //  not sure why. magix. (shrug) if you know, submit a PR
        CGFloat verticalInsets = verticalContainerInsets + verticalFrameInsets + 2.0f;
        
        //  same as above, an extra 2 points of magix
        CGFloat bubleContentWidth = MAX(stringSize.width, accessoriesWidth);
        CGFloat finalWidth = MAX(bubleContentWidth + horizontalInsetsTotal, self.bubbleImageAssetWidth) + 2.0f;
        
        finalSize = CGSizeMake(finalWidth, stringSize.height + verticalInsets + accessoriesHeight);
    }
    
    [self.messageBubbleCache setObject:[NSValue valueWithCGSize:finalSize] forKey:@([messageItem messageHash])];
    
    return finalSize;
    
}


//- (CGSize)jsq_avatarSizeForIndexPath:(NSIndexPath *)indexPath
//{
//    id<JSQMessageData> messageData = [self.collectionView.dataSource collectionView:self.collectionView messageDataForItemAtIndexPath:indexPath];
//    NSString *messageSender = [messageData senderId];
//    
//    if ([messageSender isEqualToString:[self.collectionView.dataSource senderId]]) {
//        return self.outgoingAvatarViewSize;
//    }
//    
//    return self.incomingAvatarViewSize;
//}


- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *attributesInRect = [super layoutAttributesForElementsInRect:rect];
    
    [attributesInRect enumerateObjectsUsingBlock:^(HXCollectionViewLayoutAttributes *attributesItem, NSUInteger idx, BOOL *stop) {
        if (attributesItem.representedElementCategory == UICollectionElementCategoryCell) {
            [self hx_configureMessageCellLayoutAttributes:attributesItem];
        }
        else {
            attributesItem.zIndex = -1;
        }
    }];
    
    return attributesInRect;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HXCollectionViewLayoutAttributes *customAttributes = (HXCollectionViewLayoutAttributes *)[super layoutAttributesForItemAtIndexPath:indexPath];
    
    if (customAttributes.representedElementCategory == UICollectionElementCategoryCell) {
        [self hx_configureMessageCellLayoutAttributes:customAttributes];
    }
    
    return customAttributes;
}


- (void)hx_configureMessageCellLayoutAttributes:(HXCollectionViewLayoutAttributes*) layoutAttributes
{
    NSIndexPath *indexPath = layoutAttributes.indexPath;
    
    CGSize messageBubbleSize = [self messageBubbleSizeForItemAtIndexPath:indexPath];
    
    layoutAttributes.messageBubbleContainerViewHeight = messageBubbleSize.height;
}

@end
