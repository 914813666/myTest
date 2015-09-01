//
//  FirstView.m
//  MiYu
//
//  Created by qzp on 15/7/21.
//  Copyright (c) 2015年 qzp. All rights reserved.
//

#import "FirstView.h"
#import "ClickView.h"

@implementation FirstView

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
        [self initializeUserInterface];
    }
    return self;
}


- (void) initializeUserInterface {
    CGFloat w = CGRectGetWidth(self.frame);
    CGFloat h = CGRectGetHeight(self.frame);
    
    CGFloat viewW = (w-60)/2;
//    UIView * test1_view = [[UIView alloc] initWithFrame: CGRectMake(20, 10, viewW, viewW*1.2)];
//    test1_view.backgroundColor = [UIColor clearColor];
   // [self addSubview: test1_view];
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame: CGRectMake(0, 0, w, h)];
    scrollView.contentSize = CGSizeMake(w, 1000);
    [self addSubview: scrollView];
   
    NSArray * titleArr = @[@"植物类",@"动物类",@"其他"];
    NSArray * bColorArr = @[[UIColor colorWithRed:75.0/255.0 green:182.0/255.0 blue:68.0/255.0 alpha:1],[UIColor purpleColor],[UIColor orangeColor]];
    NSArray * imgArr= @[@"zw.jpg",@"dwl4.jpg",@"zw.jpg"];
    NSArray * numberArr = @[@10, @999,@98];
    
    for (int i = 0 ; i< 3; i++) {
        
        ClickView * c1_view = [[ClickView alloc] initWithFrame: CGRectMake((i%2)*(viewW+20), 10+(viewW*1.2+30)*(i/2), viewW, viewW*1.2)
                                                    withNumber: (NSNumber *)numberArr[i]
                                                           pic: imgArr[i]
                                                         title: titleArr[i]
                                                   borderColor: bColorArr[i]];
        [scrollView addSubview: c1_view];
        
        UIButton * f_btn = [[UIButton alloc] initWithFrame: c1_view.frame];
        [scrollView addSubview: f_btn];
        f_btn.tag = 10 + i;
        [f_btn addTarget:self action: @selector(buttonPressed:) forControlEvents: UIControlEventTouchUpInside];
    }
    
    
//    UIImageView * v1_iv = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"zw.jpg"]];
//    v1_iv.frame = CGRectMake(10, 10, 120, 120);
//    v1_iv.clipsToBounds = YES;
//    v1_iv.layer.cornerRadius = CGRectGetHeight(v1_iv.frame)/2;
//    v1_iv.layer.borderWidth = 3;
//    v1_iv.layer.borderColor = [UIColor colorWithRed:75.0/255.0 green:182.0/255.0 blue:68.0/255.0 alpha:1].CGColor;
//    [test1_view addSubview: v1_iv];
//    
//    UILabel * name1_l = [[UILabel alloc] initWithFrame: CGRectMake(10, 140, 120, 30)];
//    name1_l.textAlignment = NSTextAlignmentCenter;
//    name1_l.text = @"植物类";
//    name1_l.textColor = [UIColor colorWithRed:75.0/255.0 green:182.0/255.0 blue:68.0/255.0 alpha:1];
//    [test1_view addSubview: name1_l];
//    
//    UILabel * number_l = [[UILabel alloc] initWithFrame: CGRectMake(110, 15, 38, 22)];
//    number_l.backgroundColor = [UIColor colorWithRed:253.0/255.0 green:207.0/255.0 blue:135.0/255.0 alpha:1];;
//    number_l.layer.cornerRadius = 5;
//    number_l.clipsToBounds = YES;
//    number_l.text = @"99";
//    number_l.textAlignment = NSTextAlignmentCenter;
//    number_l.textColor = [UIColor whiteColor];
//    [test1_view addSubview: number_l];
}

- (void) buttonPressed: (UIButton *) btn {
    NSInteger tag = btn.tag - 10;
    NSLog(@"%d", tag);
    self.ClickIndex(tag);
}

@end
