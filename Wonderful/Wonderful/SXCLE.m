//
//  SXColorListEntity.m
//  Wonderful
//
//  Created by dongshangxian on 15/10/30.
//  Copyright © 2015年 Sankuai. All rights reserved.
//

#import "SXCLE.h"

@implementation SXCLE

+ (instancetype)CWV:(int)value D:(NSString *)desc N:(NSString *)name
{
    SXCLE *entity = [[self alloc]init];
    entity.colorValue = value;
    entity.desc = desc;
    entity.methodName = name;
    return entity;
}

@end
