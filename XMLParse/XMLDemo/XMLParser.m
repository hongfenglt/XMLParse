/**
 *                 Created by 洪峰 on 15/8/25.
 *                 Copyright (c) 2015年 洪峰. All rights reserved.
 *
 *                 新浪微博:http://weibo.com/hongfenglt
 *                 博客地址:http://blog.csdn.net/hongfengkt
 */
//                 XMLParse
//                 XMLParser.m
//

#import "XMLParser.h"

@implementation XMLParser

{
    NSInteger currentIndex;
    NSString *currentRootElement;
    NSString *searchRootElement;
    NSXMLParser *parser;
    
    NSMutableArray *dataSource;
}



-(id)parseDataByData:(NSData *)data
{
    // 创建解析器
    parser = [[NSXMLParser alloc]initWithData:data];
    // 设置代理
    parser.delegate = self;
    
    return self;
}


-(NSMutableArray *)searchDataWithRootElement:(NSString *)root
{
    searchRootElement = root;
    // 开始解析
    [parser parse];
    
    return dataSource;
}


#pragma mark --NSXMLParser delegate

/**
 *  解析到文档的开头时会调用
 */
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
   
}

/**
 *  解析到一个元素的开始就会调用
 *
 *  @param elementName   元素名称
 *  @param attributeDict 属性字典
 */
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    //NSLog(@"开始标签  %@", elementName);
    
    
    if ([elementName isEqualToString:searchRootElement] ) {
        
        if (dataSource == nil) {
            dataSource = [NSMutableArray new];
        }
        NSMutableDictionary *dic = [NSMutableDictionary new];
        [dataSource addObject:dic];
        currentIndex = dataSource.count-1;
        currentRootElement = elementName;
        
    }
    
}

// 当解析器找到开始标记和结束标记之间的字符时，调用这个方法解析当前节点的所有字符
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    self.currentString = string;
}

/**
 *  解析到一个元素的结束就会调用
 *
 *  @param elementName   元素名称
 */
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if ([elementName isEqualToString:searchRootElement]) {
        currentRootElement = nil;
    }
    
    if ([currentRootElement isEqualToString:searchRootElement] ) {
        
        if (currentIndex != -1) {
            NSMutableDictionary *dic = dataSource[currentIndex];
            [dic setValue:self.currentString forKey:elementName];
            //NSLog(@"elementName:--%@",elementName);
        }
        
    }
    
}

/**
 *  解析到文档的结尾时会调用（解析结束）
 */
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    
}

/**
 *  解析出现错误的时候调用
 */
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"%@",parseError);
}
@end
