//
//  Person.m
//  Tekever-Digital
//
//  Created by Osama Fawzi on 10/2/19.
//  Copyright © 2019 Osama Fawzi. All rights reserved.
//
#import "Person.h"

#import "APIClient.h"

@implementation Person

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
//    self.name = (NSUInteger)[[attributes valueForKeyPath:@"name"] integerValue];
    self.name = [attributes valueForKeyPath:@"name"];
    self.height = [attributes valueForKeyPath:@"height"];
    self.mass = [attributes valueForKeyPath:@"mass"];
    self.hair_color = [attributes valueForKeyPath:@"hair_color"];
    self.skin_color = [attributes valueForKeyPath:@"skin_color"];
    self.eye_color = [attributes valueForKeyPath:@"eye_color"];
    self.birth_year = [attributes valueForKeyPath:@"birth_year"];
    self.gender = [attributes valueForKeyPath:@"gender"];
    self.films = [attributes valueForKeyPath:@"films"];
    self.species = [attributes valueForKeyPath:@"species"];
    self.vehicles = [attributes valueForKeyPath:@"vehicles"];
    self.starships = [attributes valueForKeyPath:@"starships"];

//    self.films = (NSArray)[[attributes valueForKeyPath:@"films"] array];

    
    
    return self;
}

#pragma mark -

+ (NSURLSessionDataTask *)fetchPersons:(void(^)(NSArray *posts, NSError *error))block {
    return [[APIClient sharedClient] GET:@"people/?page=1" parameters:nil progress:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSArray *postsFromResponse = [JSON valueForKeyPath:@"results"];
        NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:[postsFromResponse count]];
        for (NSDictionary *attributes in postsFromResponse) {
            Person *person = [[Person alloc] initWithAttributes:attributes];
            [mutablePosts addObject:person];
        }

        if (block) {
            block([NSArray arrayWithArray:mutablePosts], nil);
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block([NSArray array], error);
        }
    }];
}

@end

@implementation Person (NSCoding)

- (void)encodeWithCoder:(NSCoder *)aCoder {
//    [aCoder encodeInteger:(NSInteger)self.postID forKey:@"AF.postID"];
    [aCoder encodeObject:self.name forKey:@"AF.name"];
    [aCoder encodeObject:self.height forKey:@"AF.height"];
    [aCoder encodeObject:self.mass forKey:@"AF.mass"];
    [aCoder encodeObject:self.hair_color forKey:@"AF.hair_color"];
    [aCoder encodeObject:self.skin_color forKey:@"AF.skin_color"];
    [aCoder encodeObject:self.eye_color forKey:@"AF.eye_color"];
    [aCoder encodeObject:self.birth_year forKey:@"AF.birth_year"];
    [aCoder encodeObject:self.gender forKey:@"AF.gender"];
    [aCoder encodeObject:self.homeworld forKey:@"AF.homeworld"];
    [aCoder encodeObject:self.films forKey:@"AF.films"];
    [aCoder encodeObject:self.species forKey:@"AF.species"];
    [aCoder encodeObject:self.vehicles forKey:@"AF.vehicles"];
    [aCoder encodeObject:self.starships forKey:@"AF.starships"];


}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.name = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"AF.name"];
    self.height = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"AF.height"];
    self.mass = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"AF.mass"];
    self.hair_color = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"AF.hair_color"];
    self.eye_color = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"AF.eye_color"];
    self.birth_year = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"AF.birth_year"];
    self.gender = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"AF.gender"];
    self.homeworld = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"AF.homeworld"];
    self.films = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"AF.films"];
    self.species = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"AF.species"];
    self.vehicles = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"AF.vehicles"];
    self.starships = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"AF.starships"];
    return self;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
