//
//  MenuPressedDelegate.m
//  StacksOnStackOverFilled
//
//  Created by RYAN CHRISTENSEN on 2/18/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MenuPressedDelegate <NSObject>

-(void)menuOptionSelected:(NSInteger )selectedRow;

@end
