//
//  SearchQuestionsViewController.m
//  StacksOnStackOverFilled
//
//  Created by RYAN CHRISTENSEN on 2/17/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

#import "SearchQuestionsViewController.h"
#import "StackOverflowService.h"
#import "Questions.h"
#import "QuestionCell.h"

@interface SearchQuestionsViewController () <UISearchBarDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSArray *questions;

@end

@implementation SearchQuestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.searchBar.delegate = self;
  self.tableView.dataSource = self;
  self.tableView.rowHeight = UITableViewAutomaticDimension;
  
    // Do any additional setup after loading the view.
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
  [[StackOverflowService SharedService] fetchQuestionsWithSearchTerm:searchBar.text completionHandler:^(NSArray *results, NSString *error) {
    self.questions = results;
    [self.tableView reloadData];
  }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.questions.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  QuestionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QUESTION_CELL" forIndexPath:indexPath];
  
  Questions *questions = self.questions[indexPath.row];
  cell.titleTextView.text = questions.title;
  if (!questions.image) {
  [[StackOverflowService SharedService] fetchUserImage:questions.avatarURL completionHandler:^(UIImage *image) {
    questions.image = image;
    cell.avatarImage.image = image;
  }];
  } else {
    cell.avatarImage.image = questions.image;
  }
  return cell;
}



  
@end
