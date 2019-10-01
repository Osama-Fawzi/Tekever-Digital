//
//  ViewController.m
//  Tekever-Digital
//
//  Created by Osama Fawzi on 10/2/19.
//  Copyright © 2019 Osama Fawzi. All rights reserved.
//

#import "ViewController.h"

#import "Person.h"

//#import "PostTableViewCell.h"

@import AFNetworking;

@interface ViewController ()
@property (readwrite, nonatomic, strong) NSArray *persons;
@end

@implementation ViewController
@synthesize tableview;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setuptableView];
}

-(void) setuptableView {
    tableview.refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableview.frame.size.width, 100.0f)];
    [tableview.refreshControl addTarget:self action:@selector(reload:) forControlEvents:UIControlEventValueChanged];
    [self.tableview.tableHeaderView addSubview:tableview.refreshControl];
    self.tableview.rowHeight = 70.0f;
    [self reload:nil];
}

- (void)reload:(__unused id)sender {
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    NSURLSessionTask *task = [Person fetchPersons:^(NSArray *persons, NSError *error) {
        if (!error) {
            self.persons = persons;
            [self.tableview reloadData];
        }else{
            NSLog(error);
        }
    }];
    
    [tableview.refreshControl setRefreshingWithStateOfTask:task];
}




#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(__unused UITableView *)tableView
 numberOfRowsInSection:(__unused NSInteger)section
{
    return (NSInteger)[self.persons count];
}

//- (UITableViewCell *)tableView:(UITableView *)tableView
//         cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//
//    PostTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (!cell) {
//        cell = [[PostTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//    }
//
//    cell.post = self.posts[(NSUInteger)indexPath.row];
//
//    return cell;
//}

#pragma mark - UITableViewDelegate

//- (CGFloat)tableView:(__unused UITableView *)tableView
//heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return [PostTableViewCell heightForCellWithPost:self.posts[(NSUInteger)indexPath.row]];
//}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
