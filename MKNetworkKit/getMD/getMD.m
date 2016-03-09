//
//  getMD.m
//  MKNetworkKit
//
//  Created by ecar on 15/7/13.
//  Copyright (c) 2015年 张倩. All rights reserved.
//

#import "getMD.h"

@implementation getMD

- (void)getDataFromBodyUrl:(NSString *)bodyUrl andParams:(NSDictionary *)dic andHttpMethod:(NSString *)httpMethod andJsonForKey:(NSString *)key   andCompletionHander:(CompleatedBlock)completed {
    MKNetworkOperation *op = [self operationWithPath:bodyUrl params:dic httpMethod:httpMethod];
    [self useCache];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        [completedOperation responseJSONWithCompletionHandler:^(id jsonObject) {
            self.myDataArray = jsonObject[key];
            completed(self.myDataArray);
        }];
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"友情提示" message:@"网络信号可能不好,请检查网络后重新操作!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    }];
    [self enqueueOperation:op];
}

-(void)getDataFromBodyUrl:(NSString *)bodyUrl andParams:(NSDictionary *)dic andHttpMethod:(NSString *)httpMethod andCompletionHander:(CompleatedBlock)completed {
    MKNetworkOperation *op = [self operationWithPath:bodyUrl params:dic httpMethod:httpMethod];
    [op addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        self.resultStr = [completedOperation responseString];
        completed(self.resultStr);
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"友情提示" message:@"网络信号可能不好,请检查网络后重新操作!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    }];
    [self enqueueOperation:op];
}

@end
