//
//  JSQAttributedMessage.m
//  JSQMessages
//
//  Created by Ravi Teja on 19/01/16.
//  Copyright © 2016 Nineleaps Technology Solutions Pvt Ltd. All rights reserved.
//

#import "JSQAttributedMessage.h"

@implementation JSQAttributedMessage


#pragma mark - Initialization

+ (instancetype)messageWithSenderId:(NSString *)senderId
                        displayName:(NSString *)displayName
                     attributedText:(NSAttributedString *) attributedText {
    
    return [[self alloc] initWithSenderId:senderId
                        senderDisplayName:displayName
                                     date:[NSDate date]
                           attributedText:attributedText];
    
}


- (instancetype)initWithSenderId:(NSString *)senderId
               senderDisplayName:(NSString *)senderDisplayName
                            date:(NSDate *)date
                  attributedText:(NSAttributedString *) attributedText  {
    
    NSParameterAssert(senderId != nil);
    NSParameterAssert(senderDisplayName != nil);
    NSParameterAssert(date != nil);
    
    self = [super initWithSenderId:senderId senderDisplayName:senderDisplayName date:date text:attributedText.string];
    if (self) {
        _attributedText = [attributedText copy];
    }
    return self;
}


@end