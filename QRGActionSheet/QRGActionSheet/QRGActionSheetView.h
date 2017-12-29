//
//  QRGActionSheetView.h
//  QRGActionSheet
//
//  Created by 邱荣贵 on 2017/12/28.
//  Copyright © 2017年 邱久. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QRGActionSheetView : UIView

/** */
@property (nonatomic,strong) NSArray *data;

///**
// 标题颜色
// */
//@property (nonatomic,strong) UIColor *titleColor;
//
///**
// 标题字体
// */
//@property (nonatomic,strong) UIFont *titleFont;

///**
// 副标题颜色
// */
//@property (nonatomic,assign) UIColor *subtitleColor;
//
///**
// 副标题字体
// */
//@property (nonatomic,strong) UIFont *subtitleFont;;

///**
// 副标题背景色
// */
//@property (nonatomic,strong) UIColor *subtitlebgColor;
//
///**
// 标题颜色
// */
//@property (nonatomic,strong) UIColor *titlebgColor;
//
///**
// 取消标题按钮颜色
// */
//@property (nonatomic,strong) UIColor *canclebgColor;
//
///**
// 标题栏高度
// */
//@property (nonatomic,assign) CGFloat titleHeight;
//
//
///**
// 取消按钮高度
// */
//@property (nonatomic,assign) CGFloat cancleHeight;
//

- (void)show;

- (void)dismiss;

@end
