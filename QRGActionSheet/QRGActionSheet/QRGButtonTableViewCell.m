//
//  QRGButtonTableViewCell.m
//  QRGActionSheet
//
//  Created by 邱荣贵 on 2017/12/28.
//  Copyright © 2017年 邱久. All rights reserved.
//

#import "QRGButtonTableViewCell.h"
#import "QRGButton.h"
#import "QRGActionModel.h"

@interface QRGButtonTableViewCell  ()
/** */
@property (nonatomic,weak) UIButton  *actionBut;

@end
@implementation QRGButtonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        
        QRGButton *but = [QRGButton buttonWithType:UIButtonTypeCustom];
        but.frame = CGRectMake(0, 0, self.contentView.frame.size.width, 44);
        [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [but addTarget:self action:@selector(clike:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:but];
        
        self.actionBut = but;
        
    }
    
    return self;
}
- (void)clike:(UIButton *)sends{
    
    if([self.delegate respondsToSelector:@selector(QRGButtonTableViewCellClikeButtonWithIndex:)]){
        
        [self.delegate QRGButtonTableViewCellClikeButtonWithIndex:sends.tag];
    }
    
}
- (void)setMod:(QRGActionModel *)mod{
    
    _mod = mod;
    
    self.actionBut.selected = mod.selected;
    self.actionBut.tag = mod.index;
    [self.actionBut setTitle:mod.actionTitle forState:UIControlStateNormal];
    
}
@end
