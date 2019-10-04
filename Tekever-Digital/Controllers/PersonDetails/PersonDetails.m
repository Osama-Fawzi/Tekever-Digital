//
//  PersonDetails.m
//  Tekever-Digital
//
//  Created by Osama Fawzi on 10/5/19.
//  Copyright © 2019 Osama Fawzi. All rights reserved.
//

#import "PersonDetails.h"

#import "Person.h"

#import "PersonCellView.h"

@import AFNetworking;


@implementation PersonDetails
@synthesize gender,birthDay,eyeColor,hairColor,skinColor,person;

UIBarButtonItem *favButton;



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupData];
}

- (void)setupData {
    favButton = [[UIBarButtonItem alloc]
     initWithTitle:@"Favorite"
     style:UIBarButtonItemStyleBordered
     target:self
     action:@selector(addtofav:)];
    self.navigationItem.rightBarButtonItem = favButton;

//    if (person.name){
//        self.navigationItem.title = person.name;
//    }
//    if (person.gender){
//        gender.text = person.gender;
//    }
    birthDay.text = person.birth_year;
    eyeColor.text = person.eye_color;
    hairColor.text = person.hair_color;
    skinColor.text = person.skin_color;

}

-(IBAction)addtofav:(id)sender {
  [Person addToFavorite: person.url: ^(NSError *error) {
        if (!error) {
            NSLog(@"addedtofav");
            [favButton setTitle:@"Added"];
            [favButton setEnabled:false];
        }else{
            NSLog(@"%@",error);
        }
        
    }];
}




@end
