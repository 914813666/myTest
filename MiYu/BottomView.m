//
//  BottomView.m
//  MiYu
//
//  Created by qzp on 15/7/21.
//  Copyright (c) 2015年 qzp. All rights reserved.
//

#import "BottomView.h"
#import "Public.h"
@implementation BottomView

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
   // self.backgroundColor =  [UIColor colorWithRed:64.0/255.0 green:64.0/255.0 blue:84.0/255.0 alpha:1];
     // self.backgroundColor =  [UIColor colorWithRed:39.0/255.0 green:177.0/255.0 blue:180.0/255.0 alpha:1];
//      self.backgroundColor =  [UIColor colorWithRed:95.0/255.0 green:191.0/255.0 blue:96.0/255.0 alpha:1];
//     self.backgroundColor =  [UIColor colorWithRed:200.0/255.0 green:233.0/255.0 blue:231.0/255.0 alpha:1];
      self.backgroundColor =  [UIColor colorWithRed:124.0/255.0 green:196.0/255.0 blue:166.0/255.0 alpha:1];
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    
    CGFloat w = 80;
    CGFloat st = (width - w * 3 )/2+25;
    NSArray * imgNameArr = @[@"home2.png", @"col2.png", @"setup2.png"];
    for (int i = 0; i < 3; i ++) {
        UIImage * img = [UIImage imageNamed: imgNameArr[i] ];
        UIImage * newImg = [img imageWithGradientTintColor: [UIColor colorWithRed:124.0/255.0 green:196.0/255.0 blue:166.0/255.0 alpha:1]];
       //  UIImage * newImg2 = [img imageWithGradientTintColor: [UIColor colorWithRed:255.0/255.0 green:206.0/255.0 blue:121.0/255.0 alpha:1]];
        
        UIButton * btn = [[UIButton alloc] initWithFrame: CGRectMake(st, (height - 30)/2, 30, 30)];
        [btn setBackgroundImage: newImg forState: UIControlStateNormal];
        btn.tag = 10 + i;
        [btn addTarget:self action:@selector(buttonPressed:) forControlEvents: UIControlEventTouchUpInside];
        btn.adjustsImageWhenHighlighted = NO;
      //  [btn setBackgroundImage: img forState: UIControlStateSelected];
        
       // [btn setBackgroundImage: img forState: UIControlStateHighlighted];
        [self addSubview: btn];
//        UILabel * btn_l = [[UILabel alloc] initWithFrame: CGRectMake(st-5, height - 2, 40, 2)];
//        btn_l.backgroundColor =  [UIColor colorWithRed:255.0/255.0 green:206.0/255.0 blue:121.0/255.0 alpha:1];
//        [self addSubview: btn_l];
        
        
        st = st + w;
        if (i == 0) {
            btn.selected = YES;
            btn.userInteractionEnabled = NO;
            btn.layer.cornerRadius = CGRectGetHeight(btn.frame)/2;
            btn.layer.borderWidth = 3;
            btn.layer.borderColor = [UIColor colorWithRed:247.0/255.0 green:162.0/255.0 blue:172.0/255.0 alpha:1].CGColor;
        }
        
      
        
    }

    
    
}
- (void) buttonPressed: (UIButton*) btn {
    //NSLog(@"%d",btn.tag);
    btn.selected = YES;
    btn.userInteractionEnabled = NO;
    btn.layer.cornerRadius = CGRectGetHeight(btn.frame)/2;
    btn.layer.borderWidth = 3;
    btn.layer.borderColor = [UIColor colorWithRed:247.0/255.0 green:162.0/255.0 blue:172.0/255.0 alpha:1].CGColor;
    for ( int i=0; i< 3; i++) {
        UIButton * mbtn = (UIButton *)[self viewWithTag:10 + i];
       
        if (i != btn.tag - 10 ){
             mbtn.selected = NO;
            mbtn.layer.borderWidth = 0;
            mbtn.userInteractionEnabled = YES;
        }
    }
    self.SelectedIndex(btn.tag - 10);
    
}
@end
