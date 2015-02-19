//
//  MenuTableViewController.h
//  StacksOnStackOverFilled
//
//  Created by RYAN CHRISTENSEN on 2/16/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuPressedDelegate.m"


@interface MenuTableViewController : UITableViewController

@property (weak, nonatomic) id<MenuPressedDelegate> delegate;

@end
