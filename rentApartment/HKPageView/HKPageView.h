//
//  HKPageView.h
//  01-UIScrollView分页
//
//  Created by H on 16/3/30.
//  Copyright © 2016年 TanZhou. All rights reserved.
//

/*
 * 框架:多功能的集合!!!
 * 分类:系统自带\三方框架(别人写好的)\自定义框架
 */

#import <UIKit/UIKit.h>
//接口 1.0   2.0   3.0
@interface HKPageView : UIView
@property(nonatomic,strong)NSArray * imageNames ;
@property(nonatomic,strong)NSArray * image;/**< 图片数据  */
@property(nonatomic,strong)UIColor * currentColor ;/** 选中颜色  */
@property(nonatomic,strong)UIColor * OtherColor; /** 另外的颜色  */
@property(nonatomic,assign)NSTimeInterval  hk_time ;/**< 多少秒  */
+(instancetype)pageView;
@end
