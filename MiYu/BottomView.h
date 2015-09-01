//
//  BottomView.h
//  MiYu
//
//  Created by qzp on 15/7/21.
//  Copyright (c) 2015年 qzp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BottomView : UIView

@property (nonatomic, strong) void (^SelectedIndex) (NSInteger index);
@end
