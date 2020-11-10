//
//  ViewController.m
//  CollectionViewSubscriptionLabel
//
//  Created by chenyk on 15/4/24.
//  Copyright (c) 2015年 chenyk. All rights reserved.
//

 

#import "ViewController.h"
#import "IFLYCustomCollectionView.h"
#import "UIColor+HexColor.h"
#import "DOneSectionTableViewHeadView.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
 

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    IFLYCustomCollectionView * a = [[IFLYCustomCollectionView alloc] initWithFrame:self.view.bounds];
   // [self.view addSubview:a];
    
    NSArray *items = @[@"商品详情", @"商品规格"];
    UISegmentedControl *segmentController = [[UISegmentedControl alloc] initWithItems:items];
  
    [self.view addSubview:segmentController];
    
    
    
    if (@available(iOS 13, *)) {
        UIColor *tintColor = [segmentController tintColor];
        UIImage *tintColorImage = [self imageWithColor:tintColor];
        // Must set the background image for normal to something (even clear) else the rest won't work
        [segmentController setBackgroundImage:[self imageWithColor:segmentController.backgroundColor ? segmentController.backgroundColor : [UIColor clearColor]] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [segmentController setBackgroundImage:tintColorImage forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        [segmentController setBackgroundImage:[self imageWithColor:[tintColor colorWithAlphaComponent:0.2]] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
        [segmentController setBackgroundImage:tintColorImage forState:UIControlStateSelected|UIControlStateSelected barMetrics:UIBarMetricsDefault];
        [segmentController setTitleTextAttributes:@{NSForegroundColorAttributeName: tintColor, NSFontAttributeName: [UIFont systemFontOfSize:13]} forState:UIControlStateNormal];
        [segmentController setDividerImage:tintColorImage forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        segmentController.layer.borderWidth = 1;
        segmentController.layer.borderColor = [tintColor CGColor];
    }

 
    segmentController.frame = CGRectMake(10.0, 50.0, (CGRectGetWidth(self.view.bounds) - 10 * 2), 40.0);
    
    
    DOneSectionTableViewHeadView * head = [[DOneSectionTableViewHeadView alloc] initWithFrame:CGRectMake(0, 300, CGRectGetWidth(self.view.frame), 400)];
    [self.view addSubview:head];

}

- (UIImage *)imageWithColor: (UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
   

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
