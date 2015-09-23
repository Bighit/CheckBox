//
//  ViewController.m
//  CheckBox
//
//  Created by hdf on 15/6/17.
//  Copyright (c) 2015年 HTY. All rights reserved.
//

#import "ViewController.h"
#import "CheckBox.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CheckBox *box=[[CheckBox alloc]initWithItemTitleArray:@[@"111111",@"2111111",@"311111111",@"4444",@"55",@"66666666",@"777777"] columns:3];
    [self.view addSubview:box];
    [box setFrame:CGRectMake(0, 0, self.view.frame.size.width,300)];
    [box setTextColor:[UIColor redColor]];
    [box setTextFont:[UIFont systemFontOfSize:10]];
    [box setNormalImage:[UIImage imageNamed:@"icon_check_n"]];
    [box setSelectedImage:[UIImage imageNamed:@"icon_check_s"]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
