//
//  Person.h
//  Tekever-Digital
//
//  Created by Osama Fawzi on 10/2/19.
//  Copyright © 2019 Osama Fawzi. All rights reserved.
//


#import <Foundation/Foundation.h>

//@class User;

@interface Person : NSObject

@property (nonatomic, assign) NSString *name;
@property (nonatomic, assign) NSString *height;
@property (nonatomic, assign) NSString *mass;
@property (nonatomic, assign) NSString *hair_color;
@property (nonatomic, assign) NSString *skin_color;
@property (nonatomic, assign) NSString *eye_color;
@property (nonatomic, assign) NSString *birth_year;
@property (nonatomic, assign) NSString *gender;
@property (nonatomic, assign) NSString *homeworld;
@property (nonatomic, assign) NSArray *films;
@property (nonatomic, assign) NSArray *species;
@property (nonatomic, assign) NSArray *vehicles;
@property (nonatomic, assign) NSArray *starships;

//@property (nonatomic, strong) User *user;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

+ (NSURLSessionDataTask *)fetchPersons:(void (^)(NSArray *persons, NSError *error))block;

@end

@interface Person (NSCoding) <NSSecureCoding>
@end
