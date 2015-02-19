//
//  UserProfile.m
//  StacksOnStackOverFilled
//
//  Created by RYAN CHRISTENSEN on 2/18/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

#import "UserProfile.h"

@implementation UserProfile

+(NSArray *)userProfileFromJSON:(NSData *)jsonData {
  NSError *error;
  NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
  if (error) {
    //NSLog(@"%@",error.localizedDescription);
    return nil;
  }
  NSArray *items = [jsonDictionary objectForKey:@"items"];
  NSMutableArray *temp = [[NSMutableArray alloc] init];
  
  for (NSDictionary *item in items) {
    UserProfile *user = [[UserProfile alloc] init];
    user.name = item[@"display_name"];
    user.avatarURL = item[@"profile_image"];
    
    [temp addObject:user];
  }
  NSArray *final = [[NSArray alloc] initWithArray:temp];
  return final;
}

@end
