//
//  QRGActionModel.h
//  QRGActionSheet
//
//  Created by 邱荣贵 on 2017/12/29.
//  Copyright © 2017年 邱久. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QRGActionModel : NSObject

/** 是否选中*/
@property (nonatomic,assign) BOOL  selected;
/** 选择栏 title*/
@property (nonatomic,copy) NSString  *actionTitle;
/** index*/
@property (nonatomic,assign) NSInteger  index;

@end
