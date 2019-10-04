//
//  PersonCellView.m
//  Tekever-Digital
//
//  Created by Osama Fawzi on 10/5/19.
//  Copyright © 2019 Osama Fawzi. All rights reserved.
//

#import "PersonCellView.h"

#import "Person.h"


@import AFNetworking;

@implementation PersonCellView
@synthesize name,gender,birthDay,height,weight;

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }

    self.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return self;
}

- (void)setPerson:(Person *)person {
    _person = person;


//    NSLog(_person.name);
    NSString *s = _person.name;
//    if (!_person.name) {
        self.name.text = s ;
//    }
    self.gender.text = _person.gender;
    self.birthDay.text = _person.birth_year;
    self.height.text = _person.height;
    self.weight.text = _person.mass;
    
// In case there is url for image
//    [self.imageView setImageWithURL:person.avatarImageURL placeholderImage:[UIImage imageNamed:@"profile-image-placeholder"]];
    [self setNeedsLayout];
}

// In case of different height could be customized.
+ (CGFloat)heightForCellWithPerson:(Person *)person {
    return 150;
}


@end
