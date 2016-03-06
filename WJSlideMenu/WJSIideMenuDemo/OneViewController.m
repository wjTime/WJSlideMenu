//
//  OneViewController.m
//  WJSlideMenu
//  https://github.com/wjTime
//  Created by 高文杰 on 16/3/6.
//  Copyright © 2016年 高文杰. All rights reserved.
//

#import "OneViewController.h"
#import "WJSlideMenu.h"
#import "SecondViewController.h"


@interface OneViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak)WJSlideMenu *menu;
@property (nonatomic,weak)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *dataSource;
@end

@implementation OneViewController


// 懒加载
- (NSMutableArray *)dataSource{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // ******************** 添加控件 ****************************
    
    // 创建slideMenu
    CGRect frame = self.view.bounds;
    WJSlideMenu *menu = [[WJSlideMenu alloc]initWithFrame:frame];
    menu.backgroundColor = [UIColor redColor];
    [self.view addSubview:menu];
    self.menu = menu;
    
    
    
  
    // ******************** 根据自身需求布局页面 *******************
    
    // 可选设置
    menu.leftMovex = 180; //不设置默认是200
    menu.rightMovex = 220;//不设置默认是200
    
    // 根据需求自定义修改navLeftBtn
    [self.menu.navLeftBtn setImage:[UIImage imageNamed:@"choose"] forState:UIControlStateNormal];
    self.menu.navLeftBtn.backgroundColor = [UIColor clearColor];
    self.menu.navLeftBtn.imageEdgeInsets = UIEdgeInsetsMake(12, 20, 13, 20);
    
    
    // 根据需求自定义修改navRigthBtn
    [self.menu.navRigthBtn setImage:[UIImage imageNamed:@"addMore"] forState:UIControlStateNormal];
    self.menu.navRigthBtn.backgroundColor = [UIColor clearColor];
    self.menu.navRigthBtn.imageEdgeInsets = UIEdgeInsetsMake(12, 20, 13, 20);
    
    
    
    // 根据需求自定义修改navBgView titleView 等等
    self.menu.navBgView.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.8];
    self.menu.titleView.backgroundColor = [UIColor clearColor];
    self.menu.navRigthBtn.backgroundColor = [UIColor clearColor];
    self.menu.mainView.backgroundColor = [UIColor lightGrayColor];
    
    //  比如添加一个titleView的文字
    UILabel *titleLb = [[UILabel alloc]initWithFrame:self.menu.titleView.bounds];
    titleLb.text = @"WJSlideMenu";
    [self.menu.titleView addSubview:titleLb];
    
    
    
    // 创建TableView
    CGRect leftFrme = self.menu.leftMenuView.bounds;
    leftFrme.origin.y = 100;
    UITableView *tableView = [[UITableView alloc]initWithFrame:leftFrme style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.menu.leftMenuView addSubview:tableView];
    
    // 创建dataSource
    NSArray *array = @[@"menu1",@"menu2",@"menu3",@"menu4",@"menu5",@"menu6",@"menu7",@"menu8",@"menu9",@"menu10"];
    [self.dataSource addObjectsFromArray:array];
    

    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    SecondViewController *nextVc = [[SecondViewController alloc]init];
    nextVc.title = self.dataSource[indexPath.row];
    [self.navigationController pushViewController:nextVc animated:YES];
    // 设置关闭左侧菜单回到不偏移的MainMenu位置
    [self.menu closeLeftMenuView];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellAccessoryNone;
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
