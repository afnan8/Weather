//
//  Request.m
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

//// 1 - define resource URL
//NSURL *URL = [NSURL URLWithString:@"https://httpbin.org/post"];
////2 - create AFNetwork manager
//AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
//manager.requestSerializer = [AFJSONRequestSerializer serializer];
//[manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
////3 - set a body
//NSDictionary *body = @{@"Getting": @{@"Started":@{@"With":@{@"Bolina":@"go to"}},@"url":@"https://www.codavel.com/trybolina/"}};
////4 - create request
//[manager POST:URL.absoluteString
//       parameters:body
//         progress:nil
////5 - response handling
//          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//              NSLog(@"Reply POST JSON: %@", responseObject);
//          }
//          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//              NSLog(@"error: %@", error);
//          }
//     ];
