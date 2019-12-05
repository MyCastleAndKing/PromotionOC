//
//  ViewController.m
//  PromotionOC
//
//  Created by EDZ on 2019/11/25.
//  Copyright © 2019 MWorld. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
// 列表
@property (nonatomic, strong) UITableView *kindTableView;
// 数据源
@property (nonatomic, strong) NSMutableArray *allDataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}


/// 添加界面
- (void)buildUpViews {
    // 列表
    [self.view addSubview:self.kindTableView];
    // 适配
    [self.kindTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark ---- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.allDataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    return cell;
}

#pragma mark ---- UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}





#pragma mark ---- lazy
- (UITableView *)kindTableView {
    if (!_kindTableView) {
        _kindTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _kindTableView.delegate   = self;
        _kindTableView.dataSource = self;
        [_kindTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    return _kindTableView;
}

- (NSMutableArray *)allDataArray {
    if (!_allDataArray) {
        _allDataArray = [[NSMutableArray alloc] init];
    }
    return _allDataArray;
}




@end
