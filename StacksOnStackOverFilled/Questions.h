//
//  Questions.h
//  StacksOnStackOverFilled
//
//  Created by RYAN CHRISTENSEN on 2/17/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Questions : NSObject

+(NSArray *)questionsFromJSON:(NSData *)jsonData;

@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *avatarURL;
@property (strong,nonatomic) UIImage *image;

@end
