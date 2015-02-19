//
//  UserProfile.h
//  StacksOnStackOverFilled
//
//  Created by RYAN CHRISTENSEN on 2/18/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserProfile : NSObject

+(NSArray *)userProfileFromJSON:(NSData *)jsonData;

@property (retain ,nonatomic) NSString *name;
@property (retain, nonatomic) NSString *avatarURL;
@property (retain ,nonatomic) UIImage *userImage;
@end
