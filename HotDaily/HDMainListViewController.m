//
//  HDMainListViewController.m
//  HotDaily
//
//  Created by weizhou on 7/20/14.
//  Copyright (c) 2014 fengweizhou. All rights reserved.
//

#import "HDMainListViewController.h"
#import "HDMainListViewModel.h"
#import "HDMainListCell.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import <ReactiveCocoa/RACEXTScope.h>
#import <ECSlidingViewController/UIViewController+ECSlidingViewController.h>


@interface HDMainListViewController () <UIActionSheetDelegate>

@end

@implementation HDMainListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [HDMainListViewModel new];
    self.slidingViewController.anchorRightPeekAmount = 160.0;
    self.slidingViewController.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGestureTapping | ECSlidingViewControllerAnchoredGesturePanning;
    
    self.menuButton.rac_command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        return [RACSignal defer:^RACSignal *{
            [self.slidingViewController anchorTopViewToRightAnimated:YES];
            return nil;
        }];
    }];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.viewModel numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfRowsInSection:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifierWithImage = @"MainListCellWithImage";
    static NSString *identifierWithoutImage = @"MainListCellWithoutImage";
    if (indexPath.row < 3) {
        HDMainListCellWithImage *cell = [tableView dequeueReusableCellWithIdentifier:identifierWithImage forIndexPath:indexPath];
        cell.title.text = @"withimagewithimagewithimagewithimage";
        [cell.titleImage sd_setImageWithURL:[NSURL URLWithString:@"http://img3.laibafile.cn/p/m/184371599.jpg"]];
        cell.bottomView.backgroundColor = [UIColor redColor];
        return cell;
    } else {
        HDMainListCellWithoutImage *cell = [tableView dequeueReusableCellWithIdentifier:identifierWithoutImage forIndexPath:indexPath];
        cell.title.text = @"withoutimagewithoutimagewithoutimagewithoutimage";
        cell.bottomView.backgroundColor = [UIColor redColor];
        return cell;
    }
    
//TODO:[cell configureWithData:[self.viewmodel dataofindexpath:indexpath]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}













@end