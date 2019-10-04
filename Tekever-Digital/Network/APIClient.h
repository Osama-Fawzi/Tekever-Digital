//
//  APIClient.h
//  Tekever-Digital
//
//  Created by Osama Fawzi on 10/2/19.
//  Copyright © 2019 Osama Fawzi. All rights reserved.
//


#import <Foundation/Foundation.h>
@import AFNetworking;

@interface APIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;
+ (instancetype)WebhookClient;

@end

