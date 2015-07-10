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

#import "HXExtendedMessage.h"

@implementation HXExtendedMessage


#pragma mark - Initialization

+ (instancetype)messageWithSenderId:(NSString *)senderId
                        displayName:(NSString *)displayName
                               type:(HXExtendedDataMessageType) messageType {
    
    return [[self alloc] initWithSenderId:senderId
                        senderDisplayName:displayName
                                     date:[NSDate date]
                                     type:messageType];
                        
    
}


- (instancetype)initWithSenderId:(NSString *)senderId
               senderDisplayName:(NSString *)senderDisplayName
                            date:(NSDate *)date
                          type:(HXExtendedDataMessageType) messageType {
    
    NSParameterAssert(senderId != nil);
    NSParameterAssert(senderDisplayName != nil);
    NSParameterAssert(date != nil);
    
    self = [super initWithSenderId:senderId senderDisplayName:senderDisplayName date:date text:@""];
    if (self) {
        _messageType = messageType;
    }
    return self;
}


- (NSUInteger)hash {
    NSUInteger contentHash = self.text.hash ^ self.image.hash ^ self.titleForButton.hash ^ self.titleForLeftButton.hash ^ self.titleForRightButton.hash + self.messageType;
    return self.senderId.hash ^ self.date.hash ^ contentHash;
}

@end
