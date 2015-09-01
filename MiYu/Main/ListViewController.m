//
//  ListViewController.m
//  MiYu
//
//  Created by qzp on 15/7/22.
//  Copyright (c) 2015年 qzp. All rights reserved.
//

#import "ListViewController.h"
#import "TableViewCell.h"

@interface ListViewController () <UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:223.0/255.0 green:242.0/255.0 blue:247.0/255.0 alpha:1];
    [self initializeUserInterface];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) initializeUserInterface {
    _tableView = [[UITableView alloc] initWithFrame: CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.bounds)) style: UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.rowHeight = 100;
      _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview: _tableView];

}

#pragma mark - UITableViewDataSource-
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //UINib * nib = [UINib nibWithNibName: @"TableViewCell" bundle: [NSBundle mainBundle]];
    
    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: @"CELL"];
    if (cell == nil) {
        NSArray * nib = [[NSBundle mainBundle] loadNibNamed: @"TableViewCell" owner: nil options: nil];
        cell = nib.lastObject;
    }
   
    
    return  cell;

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  10;
}

@end
