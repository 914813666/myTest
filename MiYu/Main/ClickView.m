//
//  ClickView.m
//  MiYu
//
//  Created by qzp on 15/7/22.
//  Copyright (c) 2015年 qzp. All rights reserved.
//

#import "ClickView.h"

@interface ClickView ()
@property (nonatomic, strong) NSString * picUrl;
@property (nonatomic, assign) NSNumber * number;
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) UIColor * bColor;
@end

@implementation ClickView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self initializeUserInterface];
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame withNumber:(NSNumber *)number pic:(NSString *)picUrl title:(NSString *)title borderColor:(UIColor *)bColor{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.picUrl = picUrl;
        self.number = number;
        self.title = title;
        self.bColor = bColor;
        [self initializeUserInterface];
        
    }
    return self;
}

- (void) initializeUserInterface {
    CGFloat w = CGRectGetWidth(self.frame);
    CGFloat h = CGRectGetHeight(self.frame);
    
    CGFloat viewW = (w-60)/2;
    UIView * test1_view = [[UIView alloc] initWithFrame: CGRectMake(20, 10, viewW, viewW*1.2)];
    test1_view.backgroundColor = [UIColor clearColor];
    [self addSubview: test1_view];
    
    UIImageView * v1_iv = [[UIImageView alloc] initWithImage: [UIImage imageNamed: self.picUrl]];
    v1_iv.frame = CGRectMake(10, 10, 120, 120);
    v1_iv.clipsToBounds = YES;
    v1_iv.layer.cornerRadius = CGRectGetHeight(v1_iv.frame)/2;
    v1_iv.layer.borderWidth = 3;
    //[UIColor colorWithRed:75.0/255.0 green:182.0/255.0 blue:68.0/255.0 alpha:1]
    v1_iv.layer.borderColor = self.bColor.CGColor;
    [test1_view addSubview: v1_iv];
    
    UILabel * name1_l = [[UILabel alloc] initWithFrame: CGRectMake(10, 140, 120, 30)];
    name1_l.textAlignment = NSTextAlignmentCenter;
    name1_l.text = self.title;
    name1_l.textColor = self.bColor;
    [test1_view addSubview: name1_l];
    
    UILabel * number_l = [[UILabel alloc] initWithFrame: CGRectMake(105, 15, 38, 22)];
    //number_l.backgroundColor = [UIColor colorWithRed:253.0/255.0 green:207.0/255.0 blue:135.0/255.0 alpha:1];;
    number_l.backgroundColor = self.bColor;
    number_l.layer.cornerRadius = 5;
    number_l.clipsToBounds = YES;
    NSLog(@"%@",self.number);
    NSString * str = [NSString stringWithFormat:@"%@",self.number];
    number_l.text = str;
    number_l.textAlignment = NSTextAlignmentCenter;
    number_l.textColor = [UIColor whiteColor];
    [test1_view addSubview: number_l];
    
    

}

@end
