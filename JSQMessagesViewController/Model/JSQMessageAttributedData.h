//
//  JSQMessageAttributedData.h
//  JSQMessages
//
//  Created by Ravi Teja on 19/01/16.
//  Copyright © 2016 Nineleaps Technology Solutions PVT LTD . All rights reserved.
//

#import "JSQMessageMediaData.h"

@protocol JSQMessageAttributedData <JSQMessageData>

/**
 *  @return The body text of the message.
 *
 *  @warning You must not return `nil` from this method.
 */
- (NSAttributedString *)attributedText;

@end