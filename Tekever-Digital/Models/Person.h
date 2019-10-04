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
@property (nonatomic, assign) NSString *height;
@property (nonatomic, assign) NSString *mass;
@property (nonatomic, assign) NSString *hair_color;
@property (nonatomic, assign) NSString *skin_color;
@property (nonatomic, assign) NSString *eye_color;
@property (nonatomic, assign) NSString *birth_year;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, assign) NSString *homeworld;
@property (nonatomic, assign) NSArray  *films;
@property (nonatomic, assign) NSArray *species;
@property (nonatomic, assign) NSArray *vehicles;
@property (nonatomic, assign) NSArray *starships;
@property (nonatomic, assign) NSString *url;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

+ (NSURLSessionDataTask *)fetchPersons: (int)page: (void (^)(NSArray *persons, NSError *error))block;

+ (NSURLSessionDataTask *)addToFavorite: (NSString*)url: (void (^)( NSError *error))block;


@end


