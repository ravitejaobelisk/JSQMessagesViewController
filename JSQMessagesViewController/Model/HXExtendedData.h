//
//  Created by Jesse Squires
//  http://www.jessesquires.com
//
//
//  Documentation
//  http://cocoadocs.org/docsets/JSQMessagesViewController
//
//
//  GitHub
//  https://github.com/jessesquires/JSQMessagesViewController
//
//
//  License
//  Copyright (c) 2014 Jesse Squires
//  Released under an MIT license: http://opensource.org/licenses/MIT
//

#import "JSQMessageMediaData.h"

typedef NS_ENUM(NSInteger, HXExtendedDataMessageType) {
    HXExtendedDataMessageTypeAttributedText,
    HXExtendedDataMessageTypeAttributedTextHeaderImage,
    HXExtendedDataMessageTypeAttributedTextSingleButton,
    HXExtendedDataMessageTypeAttributedTextDualButton,
    HXExtendedDataMessageTypeAttributedTextHeaderImageDualButton
};


@protocol HXExtendedData <JSQMessageData>

- (HXExtendedDataMessageType) messageType;
- (NSAttributedString *)attributedText;


@optional
- (UIImage*) image;
- (NSString*) titleForButton;

- (NSString*) titleForLeftButton;
- (NSString*) titleForRightButton;

@end
