/**
 *                 Created by 洪峰 on 15/8/25.
 *                 Copyright (c) 2015年 洪峰. All rights reserved.
 *
 *                 新浪微博:http://weibo.com/hongfenglt
 *                 博客地址:http://blog.csdn.net/hongfengkt
 */
//                 XMLParse
//                 GdataParser.m
//

#import "GdataParser.h"
#import "GDataXMLNode.h"

@interface GdataParser ()

@property(nonatomic,strong) GDataXMLDocument *document;
@end

@implementation GdataParser

- (void)parseWithData:(NSData*)data
{
    //加载整个XML数据
    self.document=[[GDataXMLDocument alloc] initWithData:data options:0 error:nil];
    //获得文档的根元素 CrReport
    GDataXMLElement* rootElement = self.document.rootElement;
    
    //获得根节点下所有CrRptByHour
    NSArray* CrRptByHour = [rootElement elementsForName:@"CrRptByHour"];
    
    for (GDataXMLElement* subByHoru in CrRptByHour) {
        //获得根节点下所有CrReportByHour 节点中的内容
        NSArray* CrReportByHour = [subByHoru elementsForName:@"CrReportByHour"];
        
        //遍历CrReportByHour 中所有内容
        for (GDataXMLElement* subElement in CrReportByHour) {
            
            //获取Hour、caption等节点中的内容,一般此处用模型来接受这些值
            NSString* Hour = [[[subElement elementsForName:@"Hour"] objectAtIndex:0] stringValue];
            NSString* caption = [[[subElement elementsForName:@"Caption"] objectAtIndex:0] stringValue];
            NSString* CrChannel = [[[subElement elementsForName:@"CrChannel"] lastObject] stringValue];
            NSString* CrRegion = [[[subElement elementsForName:@"CrRegion"] lastObject]stringValue];
            NSString* CrArea = [[[subElement elementsForName:@"CrArea"] lastObject] stringValue];
            
            NSLog(@"Hour=%@",Hour);
            NSLog(@"caption=%@",caption);
            NSLog(@"CrChannel=%@",CrChannel);
            NSLog(@"CrRegion=%@",CrRegion);
            NSLog(@"CrArea=%@",CrArea);
            NSLog(@"=======================");

            /*
             <CrReportByHour Hour=@"10" Caption=@"10-12" CrChannel=@"0.8" CrRegion=@"0.6" CrArea=@"0.7"/>
             注意如果是这种类型的数据,用下面这种形式取值
             
             [[subElement attributeForName:@"Hour"] stringValue]; //根据属性名称获取值
             
             */
        }
    }
}

@end
