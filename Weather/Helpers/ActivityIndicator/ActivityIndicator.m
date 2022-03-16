//
//  ActivityIndicator.m
//  Weather
//
//  Created by Afnan MacBook Pro on 16/03/2022.
//

#import <Foundation/Foundation.h>
#import "ActivityIndicator.h"
#import "SVProgressHUD.h"

@implementation ActivityIndicator

+(void)showIndicator {
    [SVProgressHUD setDefaultStyle: SVProgressHUDStyleCustom];
    [SVProgressHUD setDefaultMaskType: SVProgressHUDMaskTypeCustom];
    [SVProgressHUD setForegroundColor: [UIColor grayColor]];
    [SVProgressHUD setBackgroundColor: [UIColor clearColor]];
    [SVProgressHUD setBackgroundLayerColor: [[UIColor blackColor] colorWithAlphaComponent: 0.3]];
    [SVProgressHUD show];
}

+(void)hideIndicator {
    [SVProgressHUD dismiss];
}
@end
