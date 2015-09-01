//
//  Public.m
//  常用方法封装
//
//  Created by qzp on 14-6-30.
//  Copyright (c) 2014年 qzp. All rights reserved.
//

#import "Public.h"


@implementation Public
#define iOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
BOOL isBlankString (NSString * String)
{
    if (String==nil||String==NULL) {
        return YES;
    }
    if ([String isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[String stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]]length]==0) {
        return YES;
    }
    return NO;
}


BOOL inputValidation(NSString *inputStr,NSString *validationStr){
    BOOL res=YES;
    NSCharacterSet *set=[NSCharacterSet characterSetWithCharactersInString:validationStr];
    int i=0;
    while (i<inputStr.length) {
        NSString *tempStr=[inputStr substringWithRange:NSMakeRange(i, 1)];
        NSRange range=[tempStr rangeOfCharacterFromSet:set];
        if (range.length==0) {
            res=NO;
            break;
        }
        i++;
    }
    return res;
}

CGSize getStringSize(NSString *str,UIFont *font,float width){
    CGSize size;
    CGRect rect=[str boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                  options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine
                               attributes:@{NSFontAttributeName:font}
                                  context:nil];
    size=rect.size;
//    if (iOS7) {
//        CGRect rect=[str boundingRectWithSize:CGSizeMake(width, 10000)
//                                      options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|
//                     NSStringDrawingUsesLineFragmentOrigin
//                                   attributes:@{NSFontAttributeName:font}
//                                      context:nil];
//        size=rect.size;
//    }
//    else{
//        size=[str sizeWithFont:font
//                      forWidth:width
//                 lineBreakMode:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading|
//              NSStringDrawingUsesLineFragmentOrigin];
 

//    }
    return size;

}


NSString* getIdentifierByTime(){
    NSDate *date=[NSDate date];
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyyMMddHHmmsss"];
    NSString *cur=[formatter stringFromDate:date];
    return cur;
}
NSString *getCurrentTime(){
    NSDate *date=[NSDate date];
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy.MM.dd"];
    NSString *cur=[formatter stringFromDate:date];
    return cur;
}

NSString *getCurrentTimeByDateFormat(NSString * str){
    NSDate *date=[NSDate date];
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:str];
    NSString *cur=[formatter stringFromDate:date];
    return cur;
}
NSString* removeStringBlank(NSString *str){
    NSMutableString *newstr=[[NSMutableString alloc]init];
    for (int i=0; i<str.length; i++) {
        NSString *temp=[str substringWithRange:NSMakeRange(i, 1)];
    
        if ([temp isEqualToString:@" "]) {
       
        }
        else{
            [newstr appendString:temp];
           
        }
        
    }
    return newstr;
}

NSString *getWeekByCurrentTime(){
    NSArray * arrWeek=[NSArray arrayWithObjects:@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五" ,@"星期六",nil];
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit |
    NSMonthCalendarUnit |
    NSDayCalendarUnit |
    NSWeekdayCalendarUnit |
    NSHourCalendarUnit |
    NSMinuteCalendarUnit |
    NSSecondCalendarUnit;
    comps = [calendar components:unitFlags fromDate:date];
    int week = [comps weekday];
    int year=[comps year];
    int month = [comps month];
    int day = [comps day];
    
    NSInteger hour = [comps hour];
    
    NSInteger minute = [comps minute];
    
    NSInteger second = [comps second];
    NSLog(@"%d-%d-%d-%d:%d:%d",year,month,day,hour,minute,second);
    NSLog(@"%d",week);
    return [arrWeek objectAtIndex:week-1];
}

NSString *getNSString(id message){
    return [NSString stringWithFormat:@"%@",message];
}
BOOL allChinese(NSString *str){
    BOOL is=YES;
    //UTF8编码：汉字占3个字节，英文字符占1个字节
    NSInteger length=[str length];
    for (int i=0; i<length; i++) {
        NSRange range=NSMakeRange(i, 1);
        NSString *subStr=[str substringWithRange:range];
        const char *cString=[subStr UTF8String];
        if (strlen(cString)!=3) {
            return NO;
        }
        
    }
    return is;
}
BOOL haveChinese(NSString *str){
    BOOL is=NO;
    //UTF8编码：汉字占3个字节，英文字符占1个字节
    NSInteger length=[str length];
    for (int i=0; i<length; i++) {
        NSRange range=NSMakeRange(i, 1);
        NSString *subStr=[str substringWithRange:range];
        const char *cString=[subStr UTF8String];
        if (strlen(cString)==3) {
            return YES;
        }
        
    }
    return is;

}

BOOL saveImage(UIImage *img,NSString *name ){
    //0.5为压缩率
    NSData *imgData=UIImageJPEGRepresentation(img, 0.5);
    NSString *filePath=[[NSHomeDirectory() stringByAppendingString:@"/Documents/"]stringByAppendingString:name];
   // NSLog(@"%@",filePath);
    BOOL isSuccess=[imgData writeToFile:filePath atomically:NO];
    return isSuccess;
}
UIImage* sizeOfImage(UIImage *img,CGSize size){
    UIGraphicsBeginImageContext(size);
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

CALayer *calayerWith(CGRect frame,CGSize cornerRadiis,UIRectCorner corner){
    UIRectCorner corners=corner;
    UIBezierPath *meakPath=[UIBezierPath bezierPathWithRoundedRect:frame
                                                 byRoundingCorners:corners
                                                       cornerRadii:cornerRadiis];
    CAShapeLayer *maskLayer=[CAShapeLayer layer];
    maskLayer.frame=frame;
    maskLayer.path=meakPath.CGPath;
                        
    return maskLayer;
}



void alertWithMessage(NSString *message){
    UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"温馨提示"
                                                     message:message
                                                    delegate:nil
                                           cancelButtonTitle:@"确定"
                                           otherButtonTitles: nil];
    [alertView show];
}



BOOL isTruePhoneNumber(NSString *phoneNumber){
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:phoneNumber];
}
BOOL isTrueEmail(NSString *email){
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
BOOL isTrueIdCard(NSString *idCard){
    BOOL flag;
    if (idCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:idCard];
}
id getForKey(NSString *key){
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    NSData* data=[defaults objectForKey:key];
    id message=[NSKeyedUnarchiver unarchiveObjectWithData:data];
    return message;
}

void saveForKey(id message,NSString *key){
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:message] forKey:key];
    [defaults synchronize];
}



@end

@implementation QZPAutoAlert
-(instancetype)init{
    self=[super init];
    if (self) {
        
    }
    return self;
}
//
-(id)initWithFrame:(CGRect)frame message:(NSString *)message{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    
        self.backgroundColor=[UIColor whiteColor];
        self.layer.cornerRadius=2;
        self.message=message;
        [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(removeSelf:) userInfo:nil repeats:NO];
        
        //        UILabel *alertView=[[UILabel alloc]initWithFrame:self.frame];
        //        alertView.text=message;
        //        [self addSubview:alertView];
    }
    return self;
}
-(id)initWithMessage : (NSString *)message {
    self = [self initWithFrame:CGRectZero message:message];
    if (self) {
        
    }
    return self;
   
}


-(void)removeSelf:(NSTimer *)timer{
    [self dismissWithClickedButtonIndex:0 animated:NO];
    
}

@end
@implementation UIImage (Tint)
- (UIImage *) imageWithTintColor:(UIColor *)tintColor
{
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}


- (UIImage *) imageWithGradientTintColor:(UIColor *)tintColor
{
    return [self imageWithTintColor:tintColor blendMode:kCGBlendModeOverlay];
}
- (UIImage *) imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode
{
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tintedImage;
}
@end

