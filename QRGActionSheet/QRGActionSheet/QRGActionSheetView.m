//
//  QRGActionSheetView.m
//  QRGActionSheet
//
//  Created by 邱荣贵 on 2017/12/28.
//  Copyright © 2017年 邱久. All rights reserved.
//

#import "QRGActionSheetView.h"

#import "QRGButtonTableViewCell.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

#define titleH 50
#define NormalH 44

#define margen 2

@interface QRGActionSheetView ()<UITableViewDelegate,UITableViewDataSource,QRGButtonTableViewCellDelegate>

@end
@implementation QRGActionSheetView


- (instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        self.backgroundColor = [UIColor blackColor];
        self.alpha = .7;
        
    }
    return self;
}

- (void)setData:(NSArray *)data{
    
    _data = data;
    
    [self setUI];
    
}
- (void)setUI{
    
    
  
    UIButton *titleL = [UIButton buttonWithType:UIButtonTypeCustom];
    titleL.frame = CGRectMake(0, HEIGHT - titleH, WIDTH, titleH);
    [titleL setTitle:@"Cancel" forState:UIControlStateNormal];
    titleL.backgroundColor = [UIColor whiteColor];
    [titleL setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    [titleL addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:titleL];
    
    CGFloat tableH ;
    
    if(tableH < 300){
        
        tableH = self.data.count * NormalH;
    }else{
        tableH = 300;
    }
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,HEIGHT - tableH - (titleH + margen), WIDTH, tableH) style:UITableViewStylePlain];
    tableView.alwaysBounceVertical = NO;
    
    tableView.delegate = self;
    tableView.dataSource = self;
    [self addSubview:tableView];
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.data.count ;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return NormalH;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *Cell = @"Cell";
    
    QRGButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cell];
    if(!cell){
        cell = [[QRGButtonTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cell];
    }
    
    cell.delegate = self;
    
    cell.actionBut.tag = indexPath.row;
    
    [cell.actionBut setTitle:self.data[indexPath.row] forState:UIControlStateNormal];
    
    return cell;
    
}
- (void)QRGButtonTableViewCellClikeButtonWithIndex:(NSInteger)aIndex{

    NSLog(@"aIndex - ld",aIndex);
    

}
- (void)cancel:(UIButton *)sends{
    
    NSLog(@"取消选择");
    [self hidden];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
}

- (void)show{
    
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;

    [window addSubview:self];
    
}

- (void)hidden{
    
    [UIView animateWithDuration:2 animations:^{
        
        self.alpha = 0;
        [self removeFromSuperview];
        
    } completion:^(BOOL finished) {
        
    }];

}

@end
