//
//  PeopleList.h
//  Tekever-Digital
//
//  Created by Osama Fawzi on 10/2/19.
//  Copyright © 2019 Osama Fawzi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeopleList : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (readwrite, nonatomic, strong) NSMutableArray *people;
@property (readwrite, nonatomic, strong) NSMutableArray *searchResult;
@property (strong, nonatomic) UISearchController *searchController;

@end

