//
//  ViewController.m
//  QRGActionSheet
//
//  Created by 邱荣贵 on 2017/12/28.
//  Copyright © 2017年 邱久. All rights reserved.
//

#import "QRGActionSheetView.h"

#import "ViewController.h"

@interface ViewController ()
/** <#name#>*/

//@property (nonatomic,strong) QRGActionSheetView  *QRGView;

@end

@implementation ViewController


//- (QRGActionSheetView *)QRGView{
//    if(!_QRGView){
//        QRGActionSheetView  *aView = [[QRGActionSheetView alloc] initWithFrame:self.view.bounds];
//        [self.view addSubview:aView];
//        _QRGView = aView;
//
//    }
//    return _QRGView;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(150, 120, 100, 44);
    but.backgroundColor = [UIColor greenColor];
    [but setTitle:@"测试" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(clike:) forControlEvents:UIControlEventTouchUpInside];
    [but setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:but];
    
}

- (void)clike:(UIButton *)sends{
    
    NSMutableArray *data = [NSMutableArray array];
    
    
    for(int i = 0;i < 3;i ++){
        [data addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    QRGActionSheetView  *QRGView = [[QRGActionSheetView alloc] initWithFrame:self.view.bounds];
   
    [QRGView show];

    QRGView.data = [data mutableCopy];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
