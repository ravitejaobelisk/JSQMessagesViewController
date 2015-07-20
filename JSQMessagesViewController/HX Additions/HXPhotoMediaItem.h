//
//  HXPhotoMediaItem.h
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 15/07/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "JSQPhotoMediaItem.h"

@interface HXPhotoMediaItem : JSQPhotoMediaItem

- (instancetype)initWithPlaceholderImage:(UIImage *)placeholderImage;

@property (copy, nonatomic) UIImage* placeHolderImage;

@property (assign,nonatomic) BOOL loading;

@end
