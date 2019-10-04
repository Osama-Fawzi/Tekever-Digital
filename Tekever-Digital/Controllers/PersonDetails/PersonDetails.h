//
//  PersonDetails.h
//  Tekever-Digital
//
//  Created by Osama Fawzi on 10/5/19.
//  Copyright © 2019 Osama Fawzi. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Person.h"

@interface PersonDetails : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *gender;
@property (weak, nonatomic) IBOutlet UILabel *birthDay;
@property (weak, nonatomic) IBOutlet UILabel *hairColor;
@property (weak, nonatomic) IBOutlet UILabel *skinColor;
@property (weak, nonatomic) IBOutlet UILabel *eyeColor;
@property (readwrite, nonatomic, strong) Person *person;

@end

