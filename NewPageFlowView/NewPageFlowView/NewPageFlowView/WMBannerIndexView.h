//
//  WMBannerIndexView.H
//  womaiw
//
//  Created by oliver on 2018/2/26.
//  Copyright © 2018年 中粮我买网. All rights reserved.

#import <UIKit/UIKit.h>

@interface WMBannerIndexView : UIView


/** 主图 */
@property (nonatomic, strong) UIImageView *mainImageView;

/** 用来变色的view */
@property (nonatomic, strong) UIView *coverView;

/** 覆盖button */
@property (nonatomic, strong) UIButton *allCoverButton;


@end
