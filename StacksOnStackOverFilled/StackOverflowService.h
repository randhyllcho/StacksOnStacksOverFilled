//
//  StackOverflowService.h
//  StacksOnStackOverFilled
//
//  Created by RYAN CHRISTENSEN on 2/17/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StackOverflowService : NSObject

+(id)SharedService;

-(void)fetchQuestionsWithSearchTerm:(NSString *)searchTerm completionHandler:(void (^)(NSArray *results, NSString *error))completionHandler;

-(void)fetchUserInfo:(void (^) (NSArray *results, NSString *error))completionHandler;

-(void)fetchUserImage:(NSString *)avatarURL completionHandler:(void (^) (UIImage *image))completionHandler;
@end
