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

#import "DemoModelData.h"

#import "NSUserDefaults+DemoSettings.h"
#import "DemoButtonMessage.h"
#import "DemoDualButtonMesssage.h"
#import "HXPhotoMediaItem.h"


/**
 *  This is for demo/testing purposes only.
 *  This object sets up some fake model data.
 *  Do not actually do anything like this.
 */

@implementation DemoModelData

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        if ([NSUserDefaults emptyMessagesSetting]) {
            self.messages = [NSMutableArray new];
        }
        else {
            [self loadFakeMessages];
        }
        
        
        /**
         *  Create avatar images once.
         *
         *  Be sure to create your avatars one time and reuse them for good performance.
         *
         *  If you are not using avatars, ignore this.
         */
        JSQMessagesAvatarImage *jsqImage = [JSQMessagesAvatarImageFactory avatarImageWithUserInitials:@"JSQ"
                                                                                      backgroundColor:[UIColor colorWithWhite:0.85f alpha:1.0f]
                                                                                            textColor:[UIColor colorWithWhite:0.60f alpha:1.0f]
                                                                                                 font:[UIFont systemFontOfSize:14.0f]
                                                                                             diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        
        JSQMessagesAvatarImage *cookImage = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"demo_avatar_cook"]
                                                                                       diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        
        JSQMessagesAvatarImage *jobsImage = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"demo_avatar_jobs"]
                                                                                       diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        
        JSQMessagesAvatarImage *wozImage = [JSQMessagesAvatarImageFactory avatarImageWithImage:[UIImage imageNamed:@"demo_avatar_woz"]
                                                                                      diameter:kJSQMessagesCollectionViewAvatarSizeDefault];
        
        self.avatars = @{ kJSQDemoAvatarIdSquires : jsqImage,
                          kJSQDemoAvatarIdCook : cookImage,
                          kJSQDemoAvatarIdJobs : jobsImage,
                          kJSQDemoAvatarIdWoz : wozImage };
        
        
        self.users = @{ kJSQDemoAvatarIdJobs : kJSQDemoAvatarDisplayNameJobs,
                        kJSQDemoAvatarIdCook : kJSQDemoAvatarDisplayNameCook,
                        kJSQDemoAvatarIdWoz : kJSQDemoAvatarDisplayNameWoz,
                        kJSQDemoAvatarIdSquires : kJSQDemoAvatarDisplayNameSquires };
        
        
        /**
         *  Create message bubble images objects.
         *
         *  Be sure to create your bubble images one time and reuse them for good performance.
         *
         */
        JSQMessagesBubbleImageFactory *bubbleFactory = [[JSQMessagesBubbleImageFactory alloc] init];
        
        self.outgoingBubbleImageData = [bubbleFactory outgoingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleLightGrayColor]];
        self.incomingBubbleImageData = [bubbleFactory incomingMessagesBubbleImageWithColor:[UIColor jsq_messageBubbleGreenColor]];
    }
    
    return self;
}

- (void)loadFakeMessages
{
    /**
     *  Load some fake messages for demo.
     *
     *  You should have a mutable array or orderedSet, or something.
     */
//    self.messages = [[NSMutableArray alloc] initWithObjects:
//                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdSquires
//                                        senderDisplayName:kJSQDemoAvatarDisplayNameSquires
//                                                     date:[NSDate distantPast]
//                                                     text:@"Welcome to JSQMessages: A messaging UI framework for iOS."],
//                     
//                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdWoz
//                                        senderDisplayName:kJSQDemoAvatarDisplayNameWoz
//                                                     date:[NSDate distantPast]
//                                                     text:@"It is simple, elegant, and easy to use. There are super sweet default settings, but you can customize like crazy."],
//                     
//                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdSquires
//                                        senderDisplayName:kJSQDemoAvatarDisplayNameSquires
//                                                     date:[NSDate distantPast]
//                                                     text:@"It even has data detectors. You can call me tonight. My cell number is 123-456-7890. My website is www.hexedbits.com."],
//                     
//                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdJobs
//                                        senderDisplayName:kJSQDemoAvatarDisplayNameJobs
//                                                     date:[NSDate date]
//                                                     text:@"JSQMessagesViewController is nearly an exact replica of the iOS Messages App. And perhaps, better."],
//                     
//                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdCook
//                                        senderDisplayName:kJSQDemoAvatarDisplayNameCook
//                                                     date:[NSDate date]
//                                                     text:@"It is unit-tested, free, open-source, and documented."],
//                     
//                     [[JSQMessage alloc] initWithSenderId:kJSQDemoAvatarIdSquires
//                                        senderDisplayName:kJSQDemoAvatarDisplayNameSquires
//                                                     date:[NSDate date]
//                                                     text:@"Now with media messages!"],
 //                    nil];
    
    self.messages = [NSMutableArray array];
    
//    /**
//     Testing: Attributed Strings
//     */
    NSMutableAttributedString* attributedStringCremer = [NSMutableAttributedString new];
//    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.paragraphSpacingBefore = 6;

    [attributedStringCremer appendAttributedString:[[NSAttributedString alloc]
                                              initWithString:@"Clareador Whiteness Perfect - FGM"
                                              attributes:@{NSParagraphStyleAttributeName:style,
                                                           NSFontAttributeName:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline],
                                                           NSForegroundColorAttributeName:[UIColor whiteColor]}]];
    

    
    [attributedStringCremer appendAttributedString:[[NSAttributedString alloc]
                                              initWithString:@"\nPeróxido de Carbamida à 16%. Kit com 5 seringas + acessórios. Grátis 2 seringas de Condac 37%."
                                              attributes:@{NSParagraphStyleAttributeName:style,
                                                           NSFontAttributeName:[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline],
                                                           NSForegroundColorAttributeName:[UIColor grayColor]}]];
    
    [attributedStringCremer appendAttributedString:[[NSAttributedString alloc]
                                              initWithString:@"\nR$71,89"
                                              attributes:@{NSParagraphStyleAttributeName:style,
                                                           NSFontAttributeName:[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1],
                                                           NSForegroundColorAttributeName:[UIColor grayColor],
                                                           NSStrikethroughStyleAttributeName:@1}]];
    
    [attributedStringCremer appendAttributedString:[[NSAttributedString alloc]
                                              initWithString:@" R$67,90"
                                              attributes:@{NSFontAttributeName:[UIFont preferredFontForTextStyle:UIFontTextStyleBody],
                                                           NSForegroundColorAttributeName:[UIColor grayColor]}]];
    
    /**
        Testing: Attributed Strings
    */
    NSMutableAttributedString* attributedStringShort = [NSMutableAttributedString new];
    
    [attributedStringShort appendAttributedString:[[NSAttributedString alloc]
                                                    initWithString:@"FGM"
                                                    attributes:@{NSParagraphStyleAttributeName:style,
                                                                 NSFontAttributeName:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline],
                                                                 NSForegroundColorAttributeName:[UIColor whiteColor]}]];
    
    
    
    [attributedStringShort appendAttributedString:[[NSAttributedString alloc]
                                                    initWithString:@"Condac 37%."
                                                    attributes:@{NSParagraphStyleAttributeName:style,
                                                                 NSFontAttributeName:[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline],
                                                                 NSForegroundColorAttributeName:[UIColor grayColor]}]];
    
    [attributedStringShort appendAttributedString:[[NSAttributedString alloc]
                                                    initWithString:@"\nR$71,89"
                                                    attributes:@{NSParagraphStyleAttributeName:style,
                                                                 NSFontAttributeName:[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1],
                                                                 NSForegroundColorAttributeName:[UIColor grayColor],
                                                                 NSStrikethroughStyleAttributeName:@1}]];
    
    [attributedStringShort appendAttributedString:[[NSAttributedString alloc]
                                                    initWithString:@" R$67,90"
                                                    attributes:@{NSFontAttributeName:[UIFont preferredFontForTextStyle:UIFontTextStyleBody],
                                                                 NSForegroundColorAttributeName:[UIColor grayColor]}]];
    
    
    NSMutableAttributedString* attributedStringPneu = [NSMutableAttributedString new];
    
    [attributedStringPneu appendAttributedString:[[NSAttributedString alloc]
                                                    initWithString:@"Cinturato P7 - LONGA VIAGEM DE EMOÇÃO"
                                                    attributes:@{NSParagraphStyleAttributeName:style,
                                                                 NSFontAttributeName:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline],
                                                                 NSForegroundColorAttributeName:[UIColor whiteColor]}]];
    
    
    
    [attributedStringPneu appendAttributedString:[[NSAttributedString alloc]
                                                    initWithString:@"\nO pneu de alta performance para carros de média e alta potência. A combinação perfeita para baixa resistênc..."
                                                    attributes:@{NSParagraphStyleAttributeName:style,
                                                                 NSFontAttributeName:[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline],
                                                                 NSForegroundColorAttributeName:[UIColor grayColor]}]];
    
    [attributedStringPneu appendAttributedString:[[NSAttributedString alloc]
                                                    initWithString:@"\nR$299,89"
                                                    attributes:@{NSParagraphStyleAttributeName:style,
                                                                 NSFontAttributeName:[UIFont preferredFontForTextStyle:UIFontTextStyleCaption1],
                                                                 NSForegroundColorAttributeName:[UIColor grayColor],
                                                                 NSStrikethroughStyleAttributeName:@1}]];
    
    [attributedStringPneu appendAttributedString:[[NSAttributedString alloc]
                                                    initWithString:@"\nR$250,90"
                                                    attributes:@{NSFontAttributeName:[UIFont preferredFontForTextStyle:UIFontTextStyleBody],
                                                                 NSForegroundColorAttributeName:[UIColor grayColor]}]];

    
    HXExtendedMessage* attributedMessage = [[HXExtendedMessage alloc]initWithSenderId:kJSQDemoAvatarIdCook
                                                                    senderDisplayName:kJSQDemoAvatarDisplayNameCook
                                                                                 date:[NSDate date]
                                                                                 text:attributedStringCremer.string];
    
    attributedMessage.attributedText = attributedStringPneu;
    [self.messages addObject:attributedMessage];
    
    HXExtendedMessage* imageHeaderDualButtonMessage = [[HXExtendedMessage alloc]initWithSenderId:kJSQDemoAvatarIdCook
                                                                               senderDisplayName:kJSQDemoAvatarDisplayNameCook
                                                                                            date:[NSDate date]
                                                                                            type:HXExtendedDataMessageTypeAttributedTextHeaderImageDualButton];
    
    imageHeaderDualButtonMessage.attributedText = attributedStringPneu;
    imageHeaderDualButtonMessage.image = [UIImage imageNamed:@"1"];
    imageHeaderDualButtonMessage.titleForLeftButton = @"Left Button";
    imageHeaderDualButtonMessage.titleForRightButton = @"Right Button";
    [self.messages addObject:imageHeaderDualButtonMessage];
    
    HXExtendedMessage* imageHeaderMessage = [[HXExtendedMessage alloc]initWithSenderId:kJSQDemoAvatarIdCook
                                                      senderDisplayName:kJSQDemoAvatarDisplayNameCook
                                                                   date:[NSDate date]
                                                                  type:HXExtendedDataMessageTypeAttributedTextHeaderImage];
    
    imageHeaderMessage.attributedText = [[NSAttributedString alloc]initWithString:@"1"];
    imageHeaderMessage.image = [UIImage imageNamed:@"1"];
    [self.messages addObject:imageHeaderMessage];
    
    
    
    
    HXExtendedMessage* imageHeaderMessage2 = [[HXExtendedMessage alloc]initWithSenderId:kJSQDemoAvatarIdCook
                                                                     senderDisplayName:kJSQDemoAvatarDisplayNameCook
                                                                                  date:[NSDate date]
                                                                                  type:HXExtendedDataMessageTypeAttributedTextHeaderImage];
    
    imageHeaderMessage2.attributedText = [[NSAttributedString alloc]initWithString:@"2"];
    imageHeaderMessage2.image = [UIImage imageNamed:@"2"];
    [self.messages addObject:imageHeaderMessage2];
    
    
    HXExtendedMessage* imageHeaderMessageOutgoing2 = [[HXExtendedMessage alloc]initWithSenderId:kJSQDemoAvatarIdSquires
                                                                      senderDisplayName:kJSQDemoAvatarDisplayNameCook
                                                                                   date:[NSDate date]
                                                                                   type:HXExtendedDataMessageTypeAttributedTextHeaderImage];
    
    imageHeaderMessageOutgoing2.attributedText = [[NSAttributedString alloc]initWithString:@"2"];
    imageHeaderMessageOutgoing2.image = [UIImage imageNamed:@"2"];
    [self.messages addObject:imageHeaderMessageOutgoing2];
    
    
    
    HXExtendedMessage* imageHeaderMessage3 = [[HXExtendedMessage alloc]initWithSenderId:kJSQDemoAvatarIdCook
                                                                     senderDisplayName:kJSQDemoAvatarDisplayNameCook
                                                                                  date:[NSDate date]
                                                                                  type:HXExtendedDataMessageTypeAttributedTextHeaderImage];
    
    imageHeaderMessage3.attributedText = [[NSAttributedString alloc]initWithString:@"3"];
    imageHeaderMessage3.image = [UIImage imageNamed:@"3"];
    [self.messages addObject:imageHeaderMessage3];

    HXExtendedMessage* imageHeaderMessage4 = [[HXExtendedMessage alloc]initWithSenderId:kJSQDemoAvatarIdCook
                                                                     senderDisplayName:kJSQDemoAvatarDisplayNameCook
                                                                                  date:[NSDate date]
                                                                                  type:HXExtendedDataMessageTypeAttributedTextHeaderImage];
    
    imageHeaderMessage4.attributedText = [[NSAttributedString alloc]initWithString:@"4"];
    imageHeaderMessage4.image = [UIImage imageNamed:@"4"];
    [self.messages addObject:imageHeaderMessage4];

    HXExtendedMessage* imageHeaderMessag5 = [[HXExtendedMessage alloc]initWithSenderId:kJSQDemoAvatarIdCook
                                                                     senderDisplayName:kJSQDemoAvatarDisplayNameCook
                                                                                  date:[NSDate date]
                                                                                  type:HXExtendedDataMessageTypeAttributedTextHeaderImage];
    
    imageHeaderMessag5.attributedText = [[NSAttributedString alloc]initWithString:@"5"];
    imageHeaderMessag5.image = [UIImage imageNamed:@"5"];
    [self.messages addObject:imageHeaderMessag5];
    
    HXExtendedMessage* imageHeaderMessag6 = [[HXExtendedMessage alloc]initWithSenderId:kJSQDemoAvatarIdSquires
                                                                     senderDisplayName:kJSQDemoAvatarDisplayNameCook
                                                                                  date:[NSDate date]
                                                                                  type:HXExtendedDataMessageTypeAttributedTextHeaderImage];
    
    imageHeaderMessag6.attributedText = [[NSAttributedString alloc]initWithString:@"6"];;
    imageHeaderMessag6.image = [UIImage imageNamed:@"6"];
    [self.messages addObject:imageHeaderMessag6];
    
    
    HXExtendedMessage* imageHeaderMessagOutGoing6 = [[HXExtendedMessage alloc]initWithSenderId:kJSQDemoAvatarIdCook
                                                                     senderDisplayName:kJSQDemoAvatarDisplayNameCook
                                                                                  date:[NSDate date]
                                                                                  type:HXExtendedDataMessageTypeAttributedTextHeaderImage];
    
    imageHeaderMessagOutGoing6.attributedText = [[NSAttributedString alloc]initWithString:@"6"];;
    imageHeaderMessagOutGoing6.image = [UIImage imageNamed:@"6"];
    [self.messages addObject:imageHeaderMessagOutGoing6];
    
    HXExtendedMessage* imageHeaderMessage7 = [[HXExtendedMessage alloc]initWithSenderId:kJSQDemoAvatarIdCook
                                                                     senderDisplayName:kJSQDemoAvatarDisplayNameCook
                                                                                  date:[NSDate date]
                                                                                  type:HXExtendedDataMessageTypeAttributedTextHeaderImage];
    
    imageHeaderMessage7.attributedText = [[NSAttributedString alloc]initWithString:@"7"];;
    imageHeaderMessage7.image = [UIImage imageNamed:@"7"];
    [self.messages addObject:imageHeaderMessage7];
    
    HXExtendedMessage* imageHeaderMessage8 = [[HXExtendedMessage alloc]initWithSenderId:kJSQDemoAvatarIdCook
                                                                     senderDisplayName:kJSQDemoAvatarDisplayNameCook
                                                                                  date:[NSDate date]
                                                                                  type:HXExtendedDataMessageTypeAttributedTextHeaderImage];
    
    imageHeaderMessage8.attributedText = [[NSAttributedString alloc]initWithString:@"8"];;
    imageHeaderMessage8.image = [UIImage imageNamed:@"8"];
    [self.messages addObject:imageHeaderMessage8];
    
    HXExtendedMessage* imageHeaderMessag9 = [[HXExtendedMessage alloc]initWithSenderId:kJSQDemoAvatarIdCook
                                                                     senderDisplayName:kJSQDemoAvatarDisplayNameCook
                                                                                  date:[NSDate date]
                                                                                  type:HXExtendedDataMessageTypeAttributedTextHeaderImage];
    
    imageHeaderMessag9.attributedText = [[NSAttributedString alloc]initWithString:@"9"];;
    imageHeaderMessag9.image = [UIImage imageNamed:@"9"];
    [self.messages addObject:imageHeaderMessag9];
    
    
    
    HXExtendedMessage* pneuHeaderMessage = [[HXExtendedMessage alloc]initWithSenderId:kJSQDemoAvatarIdSquires
                                                                     senderDisplayName:kJSQDemoAvatarDisplayNameSquires
                                                                                  date:[NSDate date]
                                                                                  type:HXExtendedDataMessageTypeAttributedTextHeaderImage];
    
    pneuHeaderMessage.attributedText = attributedStringPneu;
    pneuHeaderMessage.image = [UIImage imageNamed:@"pneu"];
    //[self.messages addObject:imageHeaderMessage];
    [self.messages addObject:pneuHeaderMessage];
    
    
    
    DemoButtonMessage* buttonMessage = [[DemoButtonMessage alloc]initWithSenderId:kJSQDemoAvatarIdSquires
                                                                     senderDisplayName:kJSQDemoAvatarDisplayNameCook
                                                                                  date:[NSDate date]
                                                                                  type:HXExtendedDataMessageTypeAttributedTextSingleButton];
    buttonMessage.attributedText = attributedStringCremer;
    buttonMessage.titleForButton = @"Click Me";
    buttonMessage.answered = NO;
    [self.messages addObject:buttonMessage];
    
    DemoButtonMessage* buttonMessageIncoming = [[DemoButtonMessage alloc]initWithSenderId:kJSQDemoAvatarIdCook
                                                                senderDisplayName:kJSQDemoAvatarDisplayNameCook
                                                                             date:[NSDate date]
                                                                             type:HXExtendedDataMessageTypeAttributedTextSingleButton];
    buttonMessageIncoming.attributedText = attributedStringCremer;
    buttonMessageIncoming.titleForButton = @"Click Me 123456789012345 12312312312312";
    [self.messages addObject:buttonMessageIncoming];
    
    DemoDualButtonMesssage* dualButtonMessage = [[DemoDualButtonMesssage alloc]initWithSenderId:kJSQDemoAvatarIdSquires
                                                                senderDisplayName:kJSQDemoAvatarDisplayNameSquires
                                                                             date:[NSDate date]
                                                                             type:HXExtendedDataMessageTypeAttributedTextDualButton];
    dualButtonMessage.attributedText = attributedStringShort;
    dualButtonMessage.titleForLeftButton = @"Left Long Long Title";
    dualButtonMessage.titleForRightButton = @"Right Long Long Title";
    
    [self.messages addObject:dualButtonMessage];
    
    DemoDualButtonMesssage* dualButtonMessageIncoming = [[DemoDualButtonMesssage alloc]initWithSenderId:kJSQDemoAvatarIdCook
                                                                    senderDisplayName:kJSQDemoAvatarDisplayNameSquires
                                                                                 date:[NSDate date]
                                                                                 type:HXExtendedDataMessageTypeAttributedTextDualButton];
    dualButtonMessageIncoming.attributedText = attributedStringCremer;
    dualButtonMessageIncoming.titleForLeftButton = @"Left";
    dualButtonMessageIncoming.titleForRightButton = @"Right Long Title";
    
    //[self.messages addObject:dualButtonMessageIncoming];
    
    DemoDualButtonMesssage* dualButtonShortMessageIncoming = [[DemoDualButtonMesssage alloc]initWithSenderId:kJSQDemoAvatarIdCook
                                                                                      senderDisplayName:kJSQDemoAvatarDisplayNameSquires
                                                                                                   date:[NSDate date]
                                                                                                   type:HXExtendedDataMessageTypeAttributedTextDualButton];
    dualButtonShortMessageIncoming.attributedText = attributedStringShort;
    dualButtonShortMessageIncoming.titleForLeftButton = @"Left";
    dualButtonShortMessageIncoming.titleForRightButton = @"Right Long Long Long Long Long Title";
    
    [self.messages addObject:dualButtonShortMessageIncoming];
    
    HXPhotoMediaItem *photoItem = [[HXPhotoMediaItem alloc] init];
    photoItem.placeHolderImage = [UIImage imageNamed:@"goldengate"];
    photoItem.loading = YES;
    JSQMessage *photoMessage = [JSQMessage messageWithSenderId:kJSQDemoAvatarIdSquires
                                                   displayName:kJSQDemoAvatarDisplayNameSquires
                                                         media:photoItem];
    [self.messages addObject:photoMessage];
    
    HXExtendedMessage* systemMessage = [[HXExtendedMessage alloc]initWithSenderId:kJSQDemoAvatarIdSquires
                                                                senderDisplayName:kJSQDemoAvatarDisplayNameSquires
                                                                             date:[NSDate date]
                                                                             type:HXExtendedDataMessageTypeSystem];
    
    systemMessage.attributedText = [[NSAttributedString alloc]initWithString:@"This message has been recevied from the system"];;
    [self.messages addObject:systemMessage];
    
    HXExtendedMessage* imageHeaderSingleButtonMessage = [[HXExtendedMessage alloc]initWithSenderId:kJSQDemoAvatarIdCook
                                                                               senderDisplayName:kJSQDemoAvatarDisplayNameCook
                                                                                            date:[NSDate date]
                                                                                            type:HXExtendedDataMessageTypeAttributedTextSingleButton];
    
    imageHeaderSingleButtonMessage.attributedText = attributedStringPneu;
    imageHeaderSingleButtonMessage.image = [UIImage imageNamed:@"1"];
    imageHeaderSingleButtonMessage.titleForButton = @"Click Me";
    [self.messages addObject:imageHeaderSingleButtonMessage];
    
    HXExtendedMessage* imageHeaderSingleButtonMessage2 = [[HXExtendedMessage alloc]initWithSenderId:kJSQDemoAvatarIdCook
                                                                                 senderDisplayName:kJSQDemoAvatarDisplayNameCook
                                                                                              date:[NSDate date]
                                                                                              type:HXExtendedDataMessageTypeAttributedTextHeaderImageSingleButton];
    
    imageHeaderSingleButtonMessage2.attributedText = attributedStringPneu;
    imageHeaderSingleButtonMessage2.image = [UIImage imageNamed:@"1"];
    imageHeaderSingleButtonMessage2.titleForButton = @"Click Me";
    [self.messages addObject:imageHeaderSingleButtonMessage2];
    
    
    //[self addPhotoMediaMessage];
    
    /**
     *  Setting to load extra messages for testing/demo
     */
    if ([NSUserDefaults extraMessagesSetting]) {
        NSArray *copyOfMessages = [self.messages copy];
        for (NSUInteger i = 0; i < 4; i++) {
            [self.messages addObjectsFromArray:copyOfMessages];
        }
    }
    
    /**
     *  Setting to load REALLY long message for testing/demo
     *  You should see "END" twice
     */
    if ([NSUserDefaults longMessageSetting]) {
        JSQMessage *reallyLongMessage = [JSQMessage messageWithSenderId:kJSQDemoAvatarIdSquires
                                                            displayName:kJSQDemoAvatarDisplayNameSquires
                                                                   text:@"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? END Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? END"];
        
        [self.messages addObject:reallyLongMessage];
    }
}

- (void)addPhotoMediaMessage
{
    JSQPhotoMediaItem *photoItem = [[JSQPhotoMediaItem alloc] initWithImage:[UIImage imageNamed:@"goldengate"]];
    JSQMessage *photoMessage = [JSQMessage messageWithSenderId:kJSQDemoAvatarIdSquires
                                                   displayName:kJSQDemoAvatarDisplayNameSquires
                                                         media:photoItem];
    [self.messages addObject:photoMessage];
}

- (void)addLocationMediaMessageCompletion:(JSQLocationMediaItemCompletionBlock)completion
{
    CLLocation *ferryBuildingInSF = [[CLLocation alloc] initWithLatitude:37.795313 longitude:-122.393757];
    
    JSQLocationMediaItem *locationItem = [[JSQLocationMediaItem alloc] init];
    [locationItem setLocation:ferryBuildingInSF withCompletionHandler:completion];
    
    JSQMessage *locationMessage = [JSQMessage messageWithSenderId:kJSQDemoAvatarIdSquires
                                                      displayName:kJSQDemoAvatarDisplayNameSquires
                                                            media:locationItem];
    [self.messages addObject:locationMessage];
}

- (void)addVideoMediaMessage
{
    // don't have a real video, just pretending
    NSURL *videoURL = [NSURL URLWithString:@"file://"];
    
    JSQVideoMediaItem *videoItem = [[JSQVideoMediaItem alloc] initWithFileURL:videoURL isReadyToPlay:YES];
    JSQMessage *videoMessage = [JSQMessage messageWithSenderId:kJSQDemoAvatarIdSquires
                                                   displayName:kJSQDemoAvatarDisplayNameSquires
                                                         media:videoItem];
    [self.messages addObject:videoMessage];
}

@end
