//
//  HomeViewController.m
//  rentApartment
//
//  Created by iMac on 19/3/7.
//  Copyright © 2019年 iMac. All rights reserved.
//

#import "HomeViewController.h"
#import "HKPageView.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong,nonatomic)UITableView *tableView;

@end

@implementation HomeViewController
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,200, self.view.bounds.size.width, self.view.bounds.size.height - 200)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    HKPageView * pageView = [HKPageView pageView];
    pageView.imageNames = @[@"000",@"001",@"002"];
    pageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    pageView.currentColor = [UIColor yellowColor];
    pageView.OtherColor = [UIColor blueColor];
    pageView.hk_time = 1;
    [self.view addSubview:pageView];
    [self.view addSubview:self.tableView];
}

#pragma mark -<UITableViewDataSource>
//区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}



//行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 2;
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        cell.backgroundColor = [UIColor whiteColor];
        
        //不显示点击效果
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //右箭头
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        
       
        
        
        
    }
   
    
    
    
    return cell;
}
@end
