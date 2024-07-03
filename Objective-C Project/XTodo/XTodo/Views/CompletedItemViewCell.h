//
//  CompletedItemViewCell.h
//  XTodo
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import "../Models/TodoItem.h"
#import "../Models/StoreOperation.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CompletedItemViewCellDelegate;

@interface CompletedItemViewCell : UITableViewCell

@property (nonatomic, weak) id<CompletedItemViewCellDelegate> delegate;

- (void)layoutTableViewCell:(TodoItem *)todoitem;
- (void)checkboxTapped:(UIButton *)sender;

@end

@protocol CompletedItemViewCellDelegate <NSObject>

- (void)completedItemViewCell:(CompletedItemViewCell *)cell didTapCheckbox:(UIButton *)checkbox isSelected:(BOOL)selected;

@end

NS_ASSUME_NONNULL_END
