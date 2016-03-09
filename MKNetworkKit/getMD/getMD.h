//
//  getMD.h
//  MKNetworkKit
//
//  Created by ecar on 15/7/13.
//  Copyright (c) 2015年 张倩. All rights reserved.
//

#import "MKNetworkEngine.h"

@interface getMD : MKNetworkEngine

@property(copy, nonatomic) id myDataArray;
@property(copy, nonatomic) id resultStr;

typedef void (^CompleatedBlock)(id anything);

- (void)getDataFromBodyUrl:(NSString *)bodyUrl andParams:(NSDictionary *)dic andHttpMethod:(NSString *)httpMethod andJsonForKey:(NSString *)key   andCompletionHander:(CompleatedBlock)completed;

- (void)getDataFromBodyUrl:(NSString *)bodyUrl andParams:(NSDictionary *)dic andHttpMethod:(NSString *)httpMethod andCompletionHander:(CompleatedBlock)completed;

@end
