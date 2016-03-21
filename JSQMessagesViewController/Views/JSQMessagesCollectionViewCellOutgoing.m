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

#import "JSQMessagesCollectionViewCellOutgoing.h"
#import "NSObject+BackgroundLayer.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@implementation JSQMessagesCollectionViewCellOutgoing

#pragma mark - Overrides

CAGradientLayer *bgLayerLeft;
CAGradientLayer *bgLayerRight;

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.messageBubbleTopLabel.textAlignment = NSTextAlignmentRight;
    self.cellBottomLabel.textAlignment = NSTextAlignmentRight;
    
    bgLayerLeft = [CAGradientLayer greyGradientForLeftView];
    bgLayerRight  = [CAGradientLayer greyGradientForRightView];
    
    [self.leftGradientView.layer insertSublayer:bgLayerLeft atIndex:0];
    [self.rightGradientView.layer insertSublayer:bgLayerRight atIndex:0];
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    [super layoutSublayersOfLayer:layer];
    [self layoutIfNeeded];
    
    bgLayerLeft.frame = self.leftGradientView.bounds;
    bgLayerRight.frame = self.rightGradientView.bounds;
}

@end
