# WJSlideMenu
a easy slide menu
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
