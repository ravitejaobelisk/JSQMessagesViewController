//
//  HXPhotoMediaItem.m
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 15/07/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "HXPhotoMediaItem.h"
#import "JSQMessagesMediaViewBubbleImageMasker.h"

@interface HXPhotoMediaItem()
@property (nonatomic,strong) UIImageView* cachedPlaceholderImageView;
@property (nonatomic,strong) UIActivityIndicatorView* spinner;
@end

@implementation HXPhotoMediaItem

- (instancetype)initWithPlaceholderImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        _placeHolderImage = [image copy];
        _cachedPlaceholderImageView = nil;
    }
    return self;
}

- (void)clearCachedMediaViews
{
    [super clearCachedMediaViews];
    _cachedPlaceholderImageView = nil;
}

- (void)setPlaceHolderImage:(UIImage *)placeHolderImage
{
    _placeHolderImage = [placeHolderImage copy];
    _cachedPlaceholderImageView = nil;
}

- (void)setAppliesMediaViewMaskAsOutgoing:(BOOL)appliesMediaViewMaskAsOutgoing
{
    [super setAppliesMediaViewMaskAsOutgoing:appliesMediaViewMaskAsOutgoing];
    _cachedPlaceholderImageView = nil;
}

- (UIView *)mediaPlaceholderView {
    if (!self.placeHolderImage) {
        return nil;
    }
    
    if (!self.cachedPlaceholderImageView) {
        CGSize size = [self mediaViewDisplaySize];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:self.placeHolderImage];
        imageView.frame = CGRectMake(0.0f, 0.0f, size.width, size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        self.cachedPlaceholderImageView = imageView;
        
        if (self.loading) [self configSpinner];
        
        [JSQMessagesMediaViewBubbleImageMasker applyBubbleImageMaskToMediaView:imageView isOutgoing:self.appliesMediaViewMaskAsOutgoing];
    }
    
    return self.cachedPlaceholderImageView;
}

- (NSUInteger)hash
{
    return super.hash ^ self.placeHolderImage.hash;
}


- (void) setLoading:(BOOL)loading {
    _loading = loading;
    if (loading) {
        [self configSpinner];
    } else {
        [self.spinner removeFromSuperview];
        self.spinner = nil;
    }
}

- (void) configSpinner {
    if (!self.cachedPlaceholderImageView) return;
    
    if (!self.spinner) {
        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [spinner startAnimating];
        spinner.translatesAutoresizingMaskIntoConstraints = NO;
        [self.cachedPlaceholderImageView addSubview:spinner];
        [self.cachedPlaceholderImageView addConstraint:[NSLayoutConstraint constraintWithItem:self.cachedPlaceholderImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:spinner attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
        [self.cachedPlaceholderImageView addConstraint:[NSLayoutConstraint constraintWithItem:self.cachedPlaceholderImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:spinner attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
        self.spinner = spinner;
    }
}


#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        _placeHolderImage = [aDecoder decodeObjectForKey:NSStringFromSelector(@selector(placeHolderImage))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.placeHolderImage forKey:NSStringFromSelector(@selector(placeHolderImage))];
}

#pragma mark - NSCopying

- (instancetype)copyWithZone:(NSZone *)zone
{
    HXPhotoMediaItem *copy = [[[self class] allocWithZone:zone] initWithPlaceholderImage:self.placeHolderImage];
    copy.image = self.image;
    copy.appliesMediaViewMaskAsOutgoing = self.appliesMediaViewMaskAsOutgoing;
    return copy;
}


@end
