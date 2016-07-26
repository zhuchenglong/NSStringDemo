//
//  ViewController.m
//  分离字符串
//
//  Created by zhuchenglong on 16/7/25.
//  Copyright © 2016年 zhuchenglong. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Pinyin.h"
@interface ViewController ()
@property(nonatomic,strong)UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1、截取字符串
    NSString *string = @"rememberMe=deleteMe; Path=/; Max-Age=0; Expires=Sun, 24-Jul-2016 07:10:13 GMT, rememberMe=KRl5InsVXhUuQSPJzkAaee7RA1SOScVmNk8UZwU7+gfIYAyw3/wwOb0hesFT/D+oHfyQWCtyUTUaGQk2/P40Mw/TBnPyYYsu9/PKF8UM6iXASb+kU1tSY/snEbBpeV6+ndKFSHI5DXvrXoMNBSKwTpvSr5FTE3gvoeyGgDD+ChQA6Ey1q6N2KoLgYJ1yNXh4igIaVMzYeI0EkCrDvff2TxmpITRWNVZVEL4Y+ZptdtbAQMhuA536AAn4B7+m003QP6nJDY9/vUjxJqWrKBM897GTvs49C2hsdVACCxHuwhLLGrQaeA4/5Awl63IHxu0306VxOS4XhjRYwHsleV+t3fwB40OWt58wfnEbhAQ0vJrkNuzoGT5hexkJdCDn5MkEUrkh789IzfAyAoTALorZhoh8kiXfeRAfCSOua7Ynv24O4IXYzwXPZWMHN/p9HdV9Lwi6Kaiu8BuiZcrpHOKbbdAa5i9icJ2n55kc9nE1RzosEpht3EhrDAlpnTFFbMxeX3GLReuFxXOFP1Vk1teJOl6AbZPopsmylaGUYvPmDGE9clEOm0atwjZcy4yAgMs2ahqOFS9IlhTyBhzxC05Z96oX/6FBth0ZIPx69atNA9H8h3txAbZaIq2fxUvAhFr7un5B3eAPWl5dGkhA5uha5ufXU8kxpImidjenIlHrsmqFXoEJnCy8Z2GQTpEIE3a4iYNDEMRJNCkC3aP0XDFn5lpCtjYwz6wiFdOncgy6MlolrTUAjYd8nltrSlblIKxXfg9IXD0D7DpVr4NjEpqFUBjiFsnXK8FxkA+TMpgC9neK3+6ZuYf6VXjBd/SuCv4oRqfHmyt7zRyuqqhueWuWYu8pU7u36xe3Yo7Q+k1qqctj+jooyGN8xh7qYTEs24YPTRQTTP9X4VgAz9wlk2NiEg==; Path=/; Max-Age=31536000; Expires=Tue, 25-Jul-2017 07:10:13 GMT; HttpOnly";
    
    NSArray *strArray1 = [string componentsSeparatedByString:@","];
    NSLog(@"strArray1----->%@",strArray1);
    NSString *lastStr = strArray1[strArray1.count-2];
    
    //将lastStr以；为分界线分离出来
    NSArray *strArray2 = [lastStr componentsSeparatedByString:@";"];
    NSLog(@"strArray2----->%@",strArray2);
    NSString *rememberMe = strArray2[0];
    NSLog(@"rememberMe----->%@",rememberMe);
    NSString *me = [rememberMe substringWithRange:NSMakeRange(9, 2)];//第9位开始，连续两个（从1开始数）
    NSLog(@"Me----->%@",me);

    
    //2、判断某段字符串中是否包含某个字符串
    if ([string rangeOfString:@"rememberMe"].location == NSNotFound) {
        NSLog(@"不存在rememberMe");
    }else{
        NSLog(@"存在rememberMe");
    }
    

    
    //3、打印NSData格式的数据--->可直接打印json格式的数据
    NSData *data = [NSData dataWithContentsOfFile:@"xxx"];
    NSString *dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"dataString------>%@",dataString);
    
    
    
    //4、过滤字符串里面的特殊符号（替换的方法）
    NSString *telephoneNum = @"1866--6666 666";
    NSString *telephone = [self deleteSpace:telephoneNum];
    NSLog(@"telephone---->%@",telephone);
    
    
   
    //5、过滤字符串的特殊字符
    NSString *oldString = @"1^8~、‘~6![5 $@$&1'3-5*8}8=9)8#";
    NSString *newString = [self deleteCustomSign:oldString];
    NSLog(@"newString---->%@",newString);
    
    
    
    //6、URL中含有中文的情况
    NSString *urlStr = @"https://www.cloudsafe.com/文件夹";
    
    //编码
    //ios9之前的方法(对中文和一些特殊字符进行编码)
    NSString *urlEncode1 = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //ios9之后的方法
     NSString *urlEncode2 = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSLog(@"ios9之前对中文进行编码---->%@",urlEncode1);
    NSLog(@"ios9之后对中文进行编码---->%@",urlEncode2);
    
    //解码
    //ios9之前的方法
    NSString* str1 = [urlStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //ios9之后的方法
    NSString*str2 = [urlStr stringByRemovingPercentEncoding];
    NSLog(@"ios9之前对中文进行解码---->%@",str1);
    NSLog(@"ios9之后对中文进行解码---->%@",str2);
    
    

    
    //字符串操作常用方法：
    NSString *string1 = @"hello world";
    
    //获取字符串长度：
    int a = (int)string1.length;
    NSLog(@"%d",a);
    
    //获取指定索引位置的字符(索引计数从零开始计数):
    char c = [string1 characterAtIndex:1];
    NSLog(@"%c",c);
    
    //字符串查找：判断是否以参数给定的字符串开头,是返回真，不是返回假。
    BOOL result1 = [string hasPrefix:@"he"];
    NSLog(@"%d",result1);
    
   // 字符串查找：判断是否以参数给定的字符串结尾,是返回真，不是返回假。
    BOOL result2 = [string hasSuffix:@"gth"];
     NSLog(@"%d",result2);
    
    
    //字符串查找：使用一个结构体NSRange：location(要查找的起始位置）和length(从当前位置向后数多长）
    NSRange range1 = [string rangeOfString:@"llo"];
    NSLog(@"%d",range1);
    
    // 字符串查找：根据范围信息获取到这个范围的字符串
    NSRange range2 = NSMakeRange(2, 4);
    NSString *string2 = [string substringWithRange:range2];
    NSLog(@"%@",string2);
    
    //字符串查找：获取指定位置开始一直到字符串结束位置的字符串
    NSString *string3 = [string substringFromIndex:3];
    NSLog(@"%@",string3);
    
    //字符串查找：获取从开始位置一直到指定位置字符串(并不获取指定位置上的字符)
    NSString *string4 = [string substringToIndex:3];
    NSLog(@"%@",string4);
    
    //字符串操作：字符串拼接:将两个字符串拼接在一起后形成一个新的字符串，原来两个字符串并未发生改变
    NSString *string11 = @"aaa";
    NSString *string22 = @"bbb";
    NSString *addString =[string11 stringByAppendingString:string22];
    NSLog(@"%@",addString);
    
    //字符串比较：比较两个字符串是否相等
    BOOL result = [string11 isEqualToString:string22];
    NSLog(@"result----->%d",result);
    
    //字符串比较：比较两个字符串的大小
    NSComparisonResult comResult = [string11 compare:string22];
    switch (comResult)
    {
        case NSOrderedAscending://升序
            NSLog(@"string11小");
            break;

        case NSOrderedDescending://降序
             NSLog(@"string11大");
            break;

        case NSOrderedSame://相等
            NSLog(@"string11和string22相等");
            break;
        default:
            break;
    }

    
    //英文字母的大小写转换---->小写转换为大写：
    NSString *bigString = [string11 uppercaseString];
    NSLog(@"bigString---->%@",bigString);
    
    //英文字母的大小写转换---->大写转换为小写：
    NSString *smallString = [bigString lowercaseString];
    NSLog(@"smallString---->%@",smallString);
  
    
    //汉字转拼音(适用于摸索搜索)
    NSString *myString1 = @"我爱北京天安门";
    NSString *myString2 = [NSString transformToPinyin:myString1];
    NSLog(@"拼音----->%@",myString2);
    
    
    //创建一个可变字符串
    NSMutableString *mString = [NSMutableString stringWithFormat:@"%@",@"aaaa"];
    
    //可变字符串拼接：
    [mString appendString:@"尾巴"];

    //可变字符串的替换
    [mString replaceCharactersInRange:NSMakeRange(1, 2) withString:@"呵呵"];
    
    //可变字符串的插入操作
    [mString insertString:@"书魁" atIndex:2];
    
    //可变字符串中删除字符串
    [mString deleteCharactersInRange:NSMakeRange(1, 2)];
    
}


//删除号码中的空格和横线
-(NSString *)deleteSpace:(NSString *)telephoneNum{
    //处理电话号码中的空格
    NSString *telephoneStr1 = [telephoneNum stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    //处理号码中的 -
    NSString *telephoneStr2 = [telephoneStr1 stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    return telephoneStr2;
}

//过滤字符串中的特殊符号
-(NSString *)deleteCustomSign:(NSString *)string{

    //定义一个特殊字符的集合
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"@／：；（）¥「」＂‘、! ;[]{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\""];
    
    //stringByTrimmingCharactersInSet能做到的仅仅是把字符串两端的非法字符过滤，但是包含在字符串里非法字符则无能为力。
    NSString *newString = [[string componentsSeparatedByCharactersInSet:characterSet]componentsJoinedByString:@""];
    
    return newString;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
