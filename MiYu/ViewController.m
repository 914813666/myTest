//
//  ViewController.m
//  MiYu
//
//  Created by qzp on 15/7/21.
//  Copyright (c) 2015年 qzp. All rights reserved.
//

#import "ViewController.h"
#import "BottomView.h"
#import "FirstView.h"
#import "ListViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.view.backgroundColor = [UIColor colorWithRed:223.0/255.0 green:242.0/255.0 blue:247.0/255.0 alpha:1];
    self.view.backgroundColor = [UIColor colorWithRed:223.0/255.0 green:242.0/255.0 blue:247.0/255.0 alpha:1];
    [self initializeUserInterface];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initializeUserInterface {
    BottomView * b_view = [[BottomView alloc] initWithFrame: CGRectMake(0, CGRectGetHeight(self.view.frame)-48, CGRectGetWidth(self.view.frame), 48)];
    [self.view addSubview: b_view];
    b_view.SelectedIndex = ^(NSInteger index) {
        NSLog(@"%ld",(long)index);
    };
    
    FirstView * first_view = [[FirstView alloc] initWithFrame: CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)-48-64)];
    first_view.backgroundColor = [UIColor clearColor];
    [self.view addSubview: first_view];
    first_view.ClickIndex = ^(NSInteger index) {
        NSLog(@"%d", index);
        ListViewController * lvc = [[ListViewController alloc] init];
        [self.navigationController pushViewController: lvc animated: YES];
    };
    
}
@end
