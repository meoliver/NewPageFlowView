//
//  MainViewController.m
//  WMNewPageFlowView
//
//  Created by MrJalen on 16/8/16.
//  Copyright © 2016年 lianjiang. All rights reserved.
//

#import "MainViewController.h"
#import "WMNewPageFlowView.h"
#import "WMBannerIndexView.h"

#define K_Width  [UIScreen mainScreen].bounds.size.width
#define K_Height [UIScreen mainScreen].bounds.size.height

@interface MainViewController () <NewPageFlowViewDelegate, NewPageFlowViewDataSource>

/** 图片数组 */
@property (nonatomic, strong) NSMutableArray *imageArray;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    // 创建图片数组
    for (int index = 0; index < 6; index++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"wm_0%d",index]];
        [self.imageArray addObject:image];
    }

    UIView *nav = [[UIView alloc] initWithFrame:CGRectMake(0, 0, K_Width, 64)];
    nav.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:nav];

    self.navigationItem.title = @"New PageFlow";
    self.view.backgroundColor = [UIColor whiteColor];

    [self setupNewPageFlowView];
}

- (void)setupNewPageFlowView {
    WMNewPageFlowView *pageFlowView = [[WMNewPageFlowView alloc] initWithFrame:CGRectMake(0, 200, K_Width, 80)];
    pageFlowView.backgroundColor = [UIColor yellowColor];
    pageFlowView.delegate = self;
    pageFlowView.dataSource = self;
    pageFlowView.minimumPageAlpha = 1;
    pageFlowView.minimumPageScale = 0.8;

    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, pageFlowView.frame.size.height - 20 - 8, K_Width, 8)];
    pageFlowView.pageControl = pageControl;
    [pageFlowView addSubview:pageControl];
    [pageFlowView startTimer];
    [self.view addSubview:pageFlowView];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark NewPageFlowView Delegate
- (CGSize)sizeForPageInFlowView:(WMNewPageFlowView *)flowView {
    return CGSizeMake(K_Width - 25, 80);
}

#pragma mark NewPageFlowView Datasource
- (NSInteger)numberOfPagesInFlowView:(WMNewPageFlowView *)flowView {
    return self.imageArray.count;
}

- (UIView *)flowView:(WMNewPageFlowView *)flowView cellForPageAtIndex:(NSInteger)index {
    WMBannerIndexView *bannerView = (WMBannerIndexView *)[flowView dequeueReusableCell];
    if (!bannerView) {
        bannerView = [[WMBannerIndexView alloc] initWithFrame:CGRectMake(0, 0, K_Width - 25, 80)];
        bannerView.layer.cornerRadius = 10;
        bannerView.layer.masksToBounds = YES;
    }

    //[bannerView.mainImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:hostUrlsImg,imageDict[@"img"]]] placeholderImage:[UIImage imageNamed:@""]];
    bannerView.mainImageView.image = self.imageArray[index];
    bannerView.allCoverButton.tag = index;
    [bannerView.allCoverButton addTarget:self action:@selector(didSelectBannerButtonClick:) forControlEvents:UIControlEventTouchUpInside];

    return bannerView;
}

#pragma mark --点击轮播图
- (void)didSelectBannerButtonClick:(UIButton *) sender {

    NSInteger index = sender.tag;

    NSLog(@"点击了第%ld张图",(long)index + 1);
}

- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(WMNewPageFlowView *)flowView {

    NSLog(@"滚动到了第%ld页",pageNumber);
}

- (NSMutableArray *)imageArray {
    if (_imageArray == nil) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}


@end
