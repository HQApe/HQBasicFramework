//
//  LaunchAdModel.m
//  HQBasicFrame
//
//  Created by zhq-t100 on 2018/1/25.
//  Copyright © 2018年 Dinpay. All rights reserved.
//

#import "LaunchAdModel.h"

@implementation LaunchAdModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValuesForKeysWithDictionary:(NSDictionary<NSString *,id> *)keyedValues
{
    for (NSString *key in keyedValues) {
        if ([keyedValues[key] isKindOfClass:[NSNull class]]) {
            continue;
        }else {
            [self setValue:keyedValues[key] forKey:key];
        }
    }
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
