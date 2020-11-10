 
#import "DOneSectionTableViewHeadView.h"
#import "DOneSectionCollectionViewCell.h"
#import <Masonry/Masonry.h>
#import "ELCVFlowLayout.h"
#import "JHCollectionViewFlowLayout.h"
static NSString * const remindJianSuoTiShiYu = @"搜索疾病/药品/症状/文章";
#define kScreenW   [[UIScreen mainScreen].bounds.size.width
#define kScreenH   [[UIScreen mainScreen].bounds.size.height
#define scale (kScreenW/375.0)

@interface DOneSectionTableViewHeadView()<UICollectionViewDataSource,UICollectionViewDelegate> {
 
}
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UIView *functionView;
@property (strong, nonatomic) UIButton *searchButton;
@end

@implementation DOneSectionTableViewHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
       // self.contentView.backgroundColor = [UIColor whiteColor]
        _functionView = [[UIView alloc] init];
        _functionView.userInteractionEnabled = YES;
        _functionView.backgroundColor = [UIColor whiteColor];
        

        [self addSubview:_functionView];
        _functionView.frame = self.bounds;
        _functionPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) - 20,CGRectGetWidth(self.bounds),20)];
        _functionPageControl.numberOfPages = 2;
        _functionPageControl.currentPage = 0;
        _functionPageControl.backgroundColor = [UIColor whiteColor];
        _functionPageControl.currentPageIndicatorTintColor = [UIColor yellowColor];
        _functionPageControl.pageIndicatorTintColor = [UIColor redColor];
        [self collectionView];
        [self addSubview:_functionPageControl];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _functionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame) - 40, CGRectGetHeight(self.bounds))];
        _functionView.userInteractionEnabled = YES;
        _functionView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_functionView];
    
        _functionPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0,CGRectGetHeight(self.frame) - 20,CGRectGetWidth(self.bounds),20)];
        _functionPageControl.numberOfPages = 2;
        _functionPageControl.currentPage = 0;
        _functionPageControl.backgroundColor = [UIColor whiteColor];
        _functionPageControl.currentPageIndicatorTintColor = [UIColor yellowColor];
        _functionPageControl.pageIndicatorTintColor = [UIColor redColor];
        [self addSubview:_functionPageControl];
        
        [self collectionView];
    }
    return self;
}

#pragma mark - Getter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        ELCVFlowLayout *flowLayout = [[ELCVFlowLayout alloc] init];
        //        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        //        flowLayout.minimumInteritemSpacing = 20;
        //        flowLayout.minimumLineSpacing = 0;
        //        flowLayout.itemSize = CGSizeMake(CGRectGetWidth(self.bounds)/4,  (CGRectGetHeight(self.frame) - 20) / 2);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.pagingEnabled = YES;
        _collectionView.bounces = NO;
        _collectionView.scrollEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[DOneSectionCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"DOneSectionCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"DOneSectionCollectionViewCell"];
        _collectionView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame)-40, CGRectGetHeight(self.functionView.frame));
        [self.functionView addSubview:_collectionView];
        
        
    }
    return _collectionView;
}


#pragma mark  collectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    [collectionView.collectionViewLayout invalidateLayout];
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 18;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
   DOneSectionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DOneSectionCollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
        [self.delegate didSelectScrollViewImage:indexPath.row];
}

//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((CGRectGetWidth(self.frame) - 40)/4,  (CGRectGetHeight(self.frame) - 20) / 2);;
    
    //  return CGSizeMake((CollectionviewWeight - 15 * proportion * 4 ) / 5.f + 10 , 16);
}
//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 0, 10, 0);
}

// 设置最小列间距，也就是左行与右一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

// 设置最小行间距，也就是前一行与后一行的中间最小间隔
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat contentoffX = scrollView.contentOffset.x;
    CGFloat currentKscreen = [UIScreen mainScreen].bounds.size.width;
    int index = ceil(contentoffX/currentKscreen);
    self.functionPageControl.currentPage = index;
}

#pragma mark - CycleImageViewDelegate
- (void)didSelectItemAtIndex:(NSInteger)index {
    if (self.delegate) {
        [_delegate didSelectScrollViewImage:index];
    }
}

- (void)searchAction {
    if (self.clickSearck) {
        self.clickSearck();
    }
    
}


- (void)setFunctionItems:(NSMutableArray *)functionItems {
   _functionItems = functionItems;
//    if (_functionItems.count == 0) {
//        [_functionView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(0);
//        }];
//    } else if (_functionItems.count<5 && _functionItems.count >0) {
//        [_functionView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(90);
//        }];
//    } else {
//        [_functionView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(180);
//        }];
//    }
    [self.collectionView reloadData];
}

#pragma mark- 轮播器网络处理


@end
