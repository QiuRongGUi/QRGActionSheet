//
//  QRGButton.m
//  QRGActionSheet
//
//  Created by 邱荣贵 on 2017/12/28.
//  Copyright © 2017年 邱久. All rights reserved.
//

#import "QRGButton.h"
#import "UIView+Frame.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width

@implementation QRGButton

- (instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
//        self.titleLabel.backgroundColor = [UIColor redColor];
//        self.imageView.backgroundColor = [UIColor orangeColor];
        
        [self setImage:[UIImage imageNamed:@"no_selected"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"selected"] forState:UIControlStateSelected];
    }
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    

    self.titleLabel.x = 20;
    self.imageView.x = self.width - self.imageView.width  - 10;
    

}
@end
