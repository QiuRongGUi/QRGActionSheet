//
//  QRGActionSheetView.m
//  QRGActionSheet
//
//  Created by 邱荣贵 on 2017/12/28.
//  Copyright © 2017年 邱久. All rights reserved.
//

#import "QRGActionSheetView.h"
#import "QRGActionModel.h"
#import "QRGButtonTableViewCell.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
/** cancel 高度*/
#define titleH 50
/** 选择栏高度*/
#define NormalH 44
/** 分割线高度*/
#define margen 2

@interface QRGActionSheetView ()<UITableViewDelegate,UITableViewDataSource,QRGButtonTableViewCellDelegate>{
    
    UITableView *tableView ;
    CGFloat tableH ;
    
}
/** <#name#>*/
@property (nonatomic,strong)     NSMutableArray *tempData;

@end
@implementation QRGActionSheetView


- (instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]){
        
        self.backgroundColor = [UIColor blackColor];
        
    }
    return self;
}

- (void)setData:(NSArray *)data{
    
    _data = data;

    self.tempData = [NSMutableArray array];
    
    __weak typeof(self) weakSelf = self;
    
    [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        QRGActionModel *mod = [[QRGActionModel alloc] init];
        mod.selected = NO;
        mod.actionTitle = obj;
        mod.index = idx;
        
        [weakSelf.tempData addObject:mod];
        
    }];
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
    
    /** 判断 选择栏高度，如有多栏可滑动*/
    tableH = self.data.count * NormalH;

    if(tableH < HEIGHT - (titleH + 100)){
        
        tableH = self.data.count * NormalH;
    }else{
        tableH = HEIGHT - (titleH + 100);
    }
    
    
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,HEIGHT - tableH - (titleH + margen), WIDTH, tableH) style:UITableViewStylePlain];
    tableView.alwaysBounceVertical = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self addSubview:tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.tempData.count ;
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
    
    cell.mod = self.tempData[indexPath.row];
    
    return cell;
    
}

#pragma mark -- QRGButtonTableViewCellDelegate

- (void)QRGButtonTableViewCellClikeButtonWithIndex:(NSInteger)aIndex{

    NSLog(@"aIndex - %ld",aIndex);
    
    QRGActionModel *mod = self.tempData[aIndex];
    mod.selected = ! mod.selected;
    
    [tableView reloadData];

}
- (void)cancel:(UIButton *)sends{
    
    NSLog(@"取消选择");
    [self dismiss];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self dismiss];

}

- (void)show{
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;

    [window addSubview:self];
    
    self.alpha = .7;

    [UIView animateWithDuration:.5 animations:^{
        
        tableView.frame =  CGRectMake(0,HEIGHT - tableH - (titleH + margen), WIDTH, tableH);

    } completion:^(BOOL finished) {
        
    }];
    
}

- (void)dismiss{
    
    [UIView animateWithDuration:.5 animations:^{

        tableView.frame =  CGRectMake(0,HEIGHT, WIDTH, tableH);
        self.alpha = 0;

    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
    }];

}

@end
