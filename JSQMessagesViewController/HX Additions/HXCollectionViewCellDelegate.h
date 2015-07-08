//
//  HXCollectionViewCellDelegate.h
//  Pods
//
//  Created by Flavio Negrão Torres on 04/07/15.
//
//

#ifndef HXCollectionViewCellDelegate_h
#define HXCollectionViewCellDelegate_h

@class HXDualButtonTextCollectionViewCell;
@class HXButtonTextCollectionViewCell;

@protocol HXCollectionViewCellDelegate <NSObject>
- (void) messagesCollectionViewCellDidTouchButton:(HXButtonTextCollectionViewCell*) cell;
- (void) messagesCollectionViewCellDidTouchLeftButton:(HXDualButtonTextCollectionViewCell*) cell;
- (void) messagesCollectionViewCellDidTouchRightButton:(HXDualButtonTextCollectionViewCell*) cell;

@end

#endif
