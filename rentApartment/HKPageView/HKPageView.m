//
//  HKPageView.m
//  01-UIScrollView分页
//
//  Created by H on 16/3/30.
//  Copyright © 2016年 TanZhou. All rights reserved.
//

#import "HKPageView.h"
@interface HKPageView ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property(nonatomic,weak)NSTimer * timer;/**< 注释  */
@end
@implementation HKPageView


-(void)setHk_time:(NSTimeInterval)hk_time
{
    _hk_time = hk_time;
    [self stopTimer];
    [self starTimer];
}





-(void)layoutSubviews
{
    [super layoutSubviews];
    self.scrollView.frame = self.bounds;
    CGFloat W = self.scrollView.frame.size.width;
    CGFloat H = self.scrollView.frame.size.height;
    //设置滚动范围
    self.scrollView.contentSize = CGSizeMake(W * self.imageNames.count, 0);
    //在这里面布局我们的ScrollView的子控件
    for (int i = 0; i<self.scrollView.subviews.count; i++) {
        UIImageView * imageView = self.scrollView.subviews[i];
        imageView.frame = CGRectMake(i * W, 0, W, H);
    }
}
#pragma mark - <初始化操作>
// 通过代码创建初始化!!!
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self = [HKPageView pageView];
    }
    return self;
}
//XIB/SB 初始化操作
-(void)awakeFromNib{
    self.hk_time = 1.5;
    self.scrollView.backgroundColor = [UIColor redColor];
    
    //添加定时器
//  self.timer = [NSTimer timerWithTimeInterval:1.5 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
//    [self.timer fire];
    
    [self starTimer];
  
}

//定时任务
-(void)nextPage
{
    
    //取出页码
    NSInteger page = self.pageControl.currentPage + 1;
    if (page == self.pageControl.numberOfPages) {
        page = 0;
    }
    //设置偏移量
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = page * self.scrollView.frame.size.width;
    //翻页..动画
    [self.scrollView setContentOffset:offset animated:YES];
    
}

//实例化
+(instancetype)pageView
{//加载XIB
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
#pragma mark - <setter方法>
-(void)setImageNames:(NSArray *)imageNames
{
    //清空子控件
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    //设置我们指示器点的个数
    self.pageControl.numberOfPages = imageNames.count;
    //设置数据
    _imageNames = imageNames;
    for (int i = 0 ; i < imageNames.count; i++) {
        UIImageView * imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:imageNames[i]];
        //设置iamgeView的内容模式
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;//超出的部分给我裁剪掉!
        [self.scrollView addSubview:imageView];
    }
}
//设置小点的颜色
-(void)setCurrentColor:(UIColor *)currentColor
{
    _currentColor = currentColor;
    self.pageControl.currentPageIndicatorTintColor = currentColor;
}
-(void)setOtherColor:(UIColor *)OtherColor
{
    _OtherColor = OtherColor;
    self.pageControl.pageIndicatorTintColor = OtherColor;
}

#pragma mark - <UIScrollViewDelegate>
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = (int)(self.scrollView.contentOffset.x/self.scrollView.bounds.size.width + 0.5);
    self.pageControl.currentPage = page;
}
//用户拖动的时候
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //结束定时器
    [self stopTimer];
}
//用户结束拖拽的时候
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //开启定时器
    [self starTimer];
}

-(void)stopTimer
{
    //使它无效
    [self.timer invalidate];
}
-(void)starTimer
{
     self.timer = [NSTimer scheduledTimerWithTimeInterval:self.hk_time target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    //告诉系统,这个timer和UI事件优先级差不多!
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

@end
