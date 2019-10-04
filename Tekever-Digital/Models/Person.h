//
//  Person.h
//  Tekever-Digital
//
//  Created by Osama Fawzi on 10/2/19.
//  Copyright © 2019 Osama Fawzi. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *height;
@property (nonatomic, strong) NSString *mass;
@property (nonatomic, strong) NSString *hair_color;
@property (nonatomic, strong) NSString *skin_color;
@property (nonatomic, strong) NSString *eye_color;
@property (nonatomic, strong) NSString *birth_year;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *homeworld;
@property (nonatomic, strong) NSArray  *films;
@property (nonatomic, strong) NSArray *species;
@property (nonatomic, strong) NSArray *vehicles;
@property (nonatomic, strong) NSArray *starships;
@property (nonatomic, strong) NSString *url;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

+ (NSURLSessionDataTask *)fetchPersons: (int)page: (void (^)(NSArray *persons, NSError *error))block;

+ (NSURLSessionDataTask *)addToFavorite: (NSString*)url: (void (^)( NSError *error))block;


@end


