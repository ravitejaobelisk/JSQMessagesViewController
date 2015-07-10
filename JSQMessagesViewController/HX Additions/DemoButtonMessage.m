//
//  DemoButtonMessage.m
//  JSQMessages
//
//  Created by Flavio Negrão Torres on 10/07/15.
//  Copyright (c) 2015 Hexed Bits. All rights reserved.
//

#import "DemoButtonMessage.h"

@implementation DemoButtonMessage

- (HXExtendedDataMessageType) messageType {
    if (self.answered) {
        return HXExtendedDataMessageTypeAttributedText;
    } else {
        return HXExtendedDataMessageTypeAttributedTextSingleButton ;
    }
}

@end
