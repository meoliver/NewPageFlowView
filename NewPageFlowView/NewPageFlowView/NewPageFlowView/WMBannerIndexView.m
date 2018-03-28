//
//  WMBannerIndexView.m
//  womaiw
//
//  Created by oliver on 2018/2/26.
//  Copyright © 2018年 中粮我买网. All rights reserved.

#import "WMBannerIndexView.h"

@implementation WMBannerIndexView

/** 初始化 */
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    if (self) {
        [self addSubview:self.mainImageView];
        [self addSubview:self.coverView];
        [self addSubview:self.allCoverButton];
    }

    return self;
}

- (UIImageView *)mainImageView {
    if (_mainImageView == nil) {
        _mainImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    }
    return _mainImageView;
}

- (UIView *)coverView {
    if (_coverView == nil) {
        _coverView = [[UIView alloc] initWithFrame:self.bounds];
//        _coverView.backgroundColor = [UIColor blackColor];
    }
    return _coverView;
}

- (UIButton *)allCoverButton {
    if (_allCoverButton == nil) {
        _allCoverButton = [[UIButton alloc] initWithFrame:self.bounds];
    }
    return _allCoverButton;
}


@end
