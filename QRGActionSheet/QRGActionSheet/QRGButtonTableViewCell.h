//
//  QRGButtonTableViewCell.h
//  QRGActionSheet
//
//  Created by 邱荣贵 on 2017/12/28.
//  Copyright © 2017年 邱久. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol QRGButtonTableViewCellDelegate <NSObject>

- (void)QRGButtonTableViewCellClikeButtonWithIndex:(NSInteger)aIndex;

@end

@class QRGActionModel;

@interface QRGButtonTableViewCell : UITableViewCell

/** <#name#>*/
@property (nonatomic,strong) QRGActionModel  *mod;
/** <#name#>*/
@property (nonatomic,weak) id<QRGButtonTableViewCellDelegate> delegate;

@end
