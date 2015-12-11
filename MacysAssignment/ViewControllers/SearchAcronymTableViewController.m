//
//  SearchAcronymTableViewController.m
//  MacysAssignment
//
//  Created by Kapil Dhingra on 12/9/15.
//  Copyright © 2015 Kapil Dhingra. All rights reserved.
//

#import "SearchAcronymTableViewController.h"
#import "SearchService.h"
#import "LongForm.h"


@interface SearchAcronymTableViewController () <UISearchBarDelegate>
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic) NSArray *searchResults;
@end

@implementation SearchAcronymTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Search Acronym";
    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, [UIApplication sharedApplication].keyWindow.bounds.size.width, 44)];
    _searchBar.placeholder = @"Enter summary text";
    self.tableView.tableHeaderView = self.searchBar;
    self.searchBar.delegate = self;
}



- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    NSLog(@"start searching for text: %@", searchBar.text);
    [SearchService searchAcronymofString:searchBar.text WithBlock:^(NSArray *acronymResults, NSError *error) {
        NSLog(@"acroresults: %lu", (unsigned long)acronymResults.count);
        self.searchResults = acronymResults;
        [self.tableView reloadData];
        searchBar.text = @"";
    }];
}


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    self.searchResults = nil;
    [self.tableView reloadData];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.searchResults count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ResultCell" forIndexPath:indexPath];
    
    // Configure the cell...
    LongForm *lf = [self.searchResults objectAtIndex:indexPath.row];
    cell.textLabel.text = lf.name;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}


@end
