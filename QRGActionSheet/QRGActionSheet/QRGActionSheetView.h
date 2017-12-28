//
//  QRGActionSheetView.h
//  QRGActionSheet
//
//  Created by 邱荣贵 on 2017/12/28.
//  Copyright © 2017年 邱久. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QRGActionSheetView : UIView

/** 莫比*/
@property (nonatomic,strong) NSArray *data;

- (void)show;

- (void)hidden;
@end
