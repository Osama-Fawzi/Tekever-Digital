//
//  PersonCellView.h
//  Tekever-Digital
//
//  Created by Osama Fawzi on 10/5/19.
//  Copyright © 2019 Osama Fawzi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Person;

@interface PersonCellView : UITableViewCell

@property (nonatomic, strong) Person *person;

+ (CGFloat)heightForCellWithPerson:(Person *)person;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *gender;
@property (weak, nonatomic) IBOutlet UILabel *birthDay;
@property (weak, nonatomic) IBOutlet UILabel *height;
@property (weak, nonatomic) IBOutlet UILabel *weight;

@end
