//
//  XmlNode.h
//  IOSWebservices
//
//  Created by rang on 13-8-8.
//  Copyright (c) 2013年 rang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XmlNode : NSObject
@property(nonatomic,strong) NSDictionary *Attributes;
@property(nonatomic,strong) NSArray *ChildNodes;
@property(weak, nonatomic,readonly) XmlNode *FirstChild;
@property(nonatomic,readonly) BOOL HasChildNodes;
@property(nonatomic,copy) NSString *InnerText;
@property(nonatomic,copy) NSString *InnerXml;
@property(weak, nonatomic,readonly) XmlNode *LastChild;
@property(nonatomic,copy) NSString *Name;
@property(nonatomic,strong) XmlNode *NextSibling;
@property(nonatomic,copy) NSString *OuterXml;
@property(nonatomic,strong) XmlNode *ParentNode;
@property(nonatomic,strong) XmlNode *PreviousSibling;
@property(nonatomic,copy) NSString *Value;
@end
