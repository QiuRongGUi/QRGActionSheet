//
//  QRGButtonTableViewCell.m
//  QRGActionSheet
//
//  Created by 邱荣贵 on 2017/12/28.
//  Copyright © 2017年 邱久. All rights reserved.
//

#import "QRGButtonTableViewCell.h"

@interface QRGButtonTableViewCell  ()
/** */

@end
@implementation QRGButtonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        but.imageView.contentMode = UIViewContentModeCenter;
        but.frame = CGRectMake(0, 0, self.contentView.frame.size.width, 44);
        but.backgroundColor = [UIColor whiteColor];
        [but setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [but addTarget:self action:@selector(clike:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:but];
        
        self.actionBut = but;
        
    }
    
    return self;
}
- (void)clike:(UIButton *)sends{
    
    NSLog(@"%ld--tag",sends.tag);
    
    if([self.delegate respondsToSelector:@selector(QRGButtonTableViewCellClikeButtonWithIndex:)]){
        
        [self.delegate QRGButtonTableViewCellClikeButtonWithIndex:sends.tag];
    }
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
