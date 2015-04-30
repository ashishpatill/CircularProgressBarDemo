//
//  ViewController.h
//  CircularProgressBarDemo
//
//  Created by Ashish Pisey on 17/04/15.
//  Copyright (c) 2015 Ashish Pisey. All rights reserved.
//

#import <UIKit/UIKit.h>

/******************************************************
 UIColorFromRGB
 ******************************************************/

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface ViewController : UIViewController
{
    CGFloat progressValue;
}


@end

