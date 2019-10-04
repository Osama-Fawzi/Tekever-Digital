//
//  ViewController.m
//  Tekever-Digital
//
//  Created by Osama Fawzi on 10/2/19.
//  Copyright © 2019 Osama Fawzi. All rights reserved.
//

#import "PeopleList.h"

#import "Person.h"

#import "PersonCellView.h"

#import "PersonDetails.h"


@import AFNetworking;


@implementation PeopleList
@synthesize tableview,people;
int page = 1;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setuptableView];
}

-(void) setuptableView {
    self.navigationItem.title = @"People List";
    self.people = [NSMutableArray array];
    if (@available(iOS 10.0, *)) {
        tableview.refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.tableview.frame.size.width, 100.0f)];
        [tableview.refreshControl addTarget:self action:@selector(reload:) forControlEvents:UIControlEventValueChanged];
        [self.tableview.tableHeaderView addSubview:tableview.refreshControl];
    } else {
        // Fallback on earlier versions
    }
    self.tableview.rowHeight = 70.0f;
    [self reload:nil];
}

- (void)reload:(__unused id)sender {
    self.navigationItem.rightBarButtonItem.enabled = NO;
    page = 1;
    [self fetchpersons];
    
   
}

- (void)fetchpersons {
    NSURLSessionTask *task = [Person fetchPersons: page: ^(NSArray *persons, NSError *error) {
        if (!error) {
            for(int i = 0; i < persons.count; i++) {
                [self.people addObject:persons[i]];
            }
            [self.tableview reloadData];
        }else{
            NSLog(@"%@", error);
        }
    }];
    
    if (@available(iOS 10.0, *)) {
        [tableview.refreshControl setRefreshingWithStateOfTask:task];
    } else {
        // Fallback on earlier versions
    }
}



#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(__unused UITableView *)tableView
 numberOfRowsInSection:(__unused NSInteger)section
{
    return (NSInteger)[self.people count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PersonCellView";

    PersonCellView *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[PersonCellView alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

    cell.person = self.people[(NSUInteger)indexPath.row];
    if (indexPath.row >= (self.people.count-5)){
        page += 1;
        [self fetchpersons];
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(__unused UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [PersonCellView heightForCellWithPerson:self.people[(NSUInteger)indexPath.row]];
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"showDetails" sender:indexPath];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetails"])
    {
        PersonDetails *vc = [segue destinationViewController];
        NSIndexPath *indexPath = (NSIndexPath *)sender;
        vc.person = self.people[indexPath.row];
    }
}

@end
