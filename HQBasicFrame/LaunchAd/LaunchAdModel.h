//
//  LaunchAdModel.h
//  HQBasicFrame
//
//  Created by zhq-t100 on 2018/1/25.
//  Copyright © 2018年 Dinpay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LaunchAdModel : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *advertUrl;
@property (copy, nonatomic) NSString *advertLink;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
