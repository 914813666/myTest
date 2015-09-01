//
//  Public.h
//  常用方法封装
//
//  Created by qzp on 14-6-30.
//  Copyright (c) 2014年 qzp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@interface Public : NSObject
//-----------字符串处理----------------------------------

//限制输入,只能输入validationstr字符串
BOOL inputValidation(NSString *inputStr,NSString *validationStr);
//文本自适应
CGSize getStringSize(NSString *str,UIFont *font,float width);

//根据当前时间生成唯一标示符
NSString* getIdentifierByTime();

//去除字符串中所有空格
NSString* removeStringBlank(NSString *str);

//转化为字符串
NSString *getNSString(id message);

//判断某字符串是否全部是中文
BOOL allChinese(NSString *str);

//判断某字符串是否包含是中文
BOOL haveChinese(NSString *str);

NSString *getCurrentTime();

//根据传入类型生产时间字符串
NSString *getCurrentTimeByDateFormat(NSString * str);

//获取今天是星期几
NSString *getWeekByCurrentTime();


//--------------图片处理--------------------------------------



//图片保存

BOOL saveImage(UIImage *img,NSString *name );

//改变图片大小
UIImage* sizeOfImage(UIImage *img,CGSize size);

//---------------图层处理-------------------------------

CALayer *calayerWith(CGRect frame,CGSize cornerRadii,UIRectCorner corner);//2014.11.10

//----------弹出框------------------------------------

void alertWithMessage(NSString *message);



//---------------------------验证-----------------------
//判断字符串是否为空,为空验证
//To determine whether a string is empty, empty validation
BOOL isBlankString(NSString *string);

//手机号验证
//Mobile phone number validation
BOOL isTruePhoneNumber(NSString *phoneNumber);
//邮箱验证
//Email address verification
BOOL isTrueEmail(NSString *email);
//身份证验证
//Idcard verification
BOOL isTrueIdCard(NSString *idCard);



//--------------NSUserDefaults--------------------------
//根据key获取保存在NSUserdefaults中的内容
// According to the key to obtain the contents of the preserved in NSUserdefaults
id getForKey(NSString *key);
//保存内容到NSUserdefaults
//Save the content to the NSUserdefaults
void saveForKey(id message,NSString *key);

#define GETIMAGE(name) [UIImage imageNamed:name]
#define Screen_Height [UIScreen mainScreen].bounds.size.height
#define Screen_Width [UIScreen mainScreen].bounds.size.width

#define StringSize(name,fontSize) [name sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}]

//---------------------定义-----------------------------
#define SCREEN_HEIGHT  (is_iOS8?[UIScreen mainScreen].bounds.size.height:[UIScreen mainScreen].bounds.size.width)
#define SCREEN_WIDTH (is_iOS8?[UIScreen mainScreen].bounds.size.width:[UIScreen mainScreen].bounds.size.height)
#define DEVICE_IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568)
#define is_iOS6 [[[UIDevice currentDevice] systemVersion] floatValue] < 7.0
#define is_iOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0&&[[[UIDevice currentDevice] systemVersion] floatValue] < 8.0
#define is_iOS8 [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0

@end

@interface QZPAutoAlert : UIAlertView

-(id)initWithFrame:(CGRect)frame message:(NSString *)message;

-(id)initWithMessage : (NSString *)message;
@end

@interface UIImage(Tint)
//只改变前景色
- (UIImage *) imageWithTintColor:(UIColor *)tintColor;
- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor;
@end
