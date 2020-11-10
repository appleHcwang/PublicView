 
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^clickSearch)(void);
@protocol DOneSectionTableViewHeadViewDelegate <NSObject>
@optional
- (void)didSelectScrollViewImage:(NSInteger)index;
@end

@interface DOneSectionTableViewHeadView : UIView
@property (strong, nonatomic) NSMutableArray *functionItems;
@property (strong, nonatomic) UIPageControl *functionPageControl;
@property (weak, nonatomic) id<DOneSectionTableViewHeadViewDelegate>delegate;
@property (copy, nonatomic) clickSearch clickSearck;
@end

NS_ASSUME_NONNULL_END
