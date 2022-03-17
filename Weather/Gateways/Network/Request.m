//
//  Request.m
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Request.h"

@implementation Request

- (void) dataTaskWithRequest:(NSURLRequest *)request
           completionHandler:(nullable void (^)(NSURLResponse *response, id _Nullable responseObject,  NSError * _Nullable error)) completionHandler {
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithBaseURL: request.URL];
    [[manager dataTaskWithRequest: request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        completionHandler(response, responseObject, error);
    }] resume];
}
@end

