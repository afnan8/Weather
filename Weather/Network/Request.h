//
//  Request.h
//  Weather
//
//  Created by Afnan MacBook Pro on 17/03/2022.
//

#ifndef Request_h
#define Request_h

@interface Request : NSObject

- (void) dataTaskWithRequest: (NSURLRequest * _Nonnull) request
           completionHandler:(nullable void (^)(NSURLResponse * _Nonnull response, id _Nullable responseObject, NSError * _Nullable error))completionHandler;
@end
    
#endif /* Request_h */
