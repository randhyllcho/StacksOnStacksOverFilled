//
//  StackOverflowService.m
//  StacksOnStackOverFilled
//
//  Created by RYAN CHRISTENSEN on 2/17/15.
//  Copyright (c) 2015 RYAN CHRISTENSEN. All rights reserved.
//

#import "StackOverflowService.h"
#import "Questions.h"

@implementation StackOverflowService

+(id)SharedService {
  
  static StackOverflowService *mySharedService;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    mySharedService = [[StackOverflowService alloc] init];
  });
  return mySharedService;
  }

-(void)fetchQuestionsWithSearchTerm:(NSString *)searchTerm completionHandler:(void (^)(NSArray *results, NSString *error))completionHandler {
  
  NSString *urlString = @"https://api.stackexchange.com/2.2/";
  urlString = [urlString stringByAppendingString:@"search?order=desc&sort=activity&site=stackoverflow&intitle="];
  urlString = [urlString stringByAppendingString:searchTerm];
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  NSString *token = [userDefaults objectForKey:@"token"];
  if (token) {
    urlString = [urlString stringByAppendingString:@"&access_token="];
    urlString = [urlString stringByAppendingString:token];
    urlString = [urlString stringByAppendingString:@"&key=l1INaEowNoCUa5VUm9nmog(("];
  }
  NSURL *url = [NSURL URLWithString:urlString];
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
  request.HTTPMethod = @"GET";
  
  NSURLSession *session = [NSURLSession sharedSession];
  
  NSURLSessionTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    if (error) {
      completionHandler(nil, @"Could not connect");
    } else {
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      NSInteger statusCode = httpResponse.statusCode;
      
      switch (statusCode) {
        case 200 ... 299:{
          NSLog(@"%ld", (long)statusCode);
          NSArray *results =[Questions questionsFromJSON:data];
          dispatch_async(dispatch_get_main_queue(), ^{
            if (results) {
              completionHandler(results, nil);
            } else {
              completionHandler(nil, @"search could not be completed");
            }
          });
        }
          break;
          
        default:
          //NSLog(@"%ld", (long)statusCode);
          break;
      }
    }
  }];
  [dataTask resume];
}

-(void)fetchUserImage:(NSString *)avatarURL completionHandler:(void (^) (UIImage *image))completionHandler {
  dispatch_queue_t imageQueue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
  dispatch_async(imageQueue, ^{
    NSURL *url = [NSURL URLWithString:avatarURL];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    dispatch_async(dispatch_get_main_queue(), ^{
      completionHandler(image);
    });
  });
}


@end
