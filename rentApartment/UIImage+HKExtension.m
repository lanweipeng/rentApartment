//
//  UIImage+HKExtension.m
//  百思不得姐--001
//
//  Created by H on 16/6/25.
//  Copyright © 2016年 TanZhou. All rights reserved.
//

#import "UIImage+HKExtension.h"

@implementation UIImage (HKExtension)


+(UIImage *)originarImageNamed:(NSString *)name
{
    UIImage * image = [UIImage imageNamed:name];
    
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

+(UIImage *)hk_originarImageNamed:(NSString *)name
{
    UIImage * image = [UIImage imageNamed:name];
    
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}
@end
