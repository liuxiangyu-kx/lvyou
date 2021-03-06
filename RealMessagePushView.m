//
//  RealMessagePushView.m
//  百度旅游
//
//  Created by Lucky on 13-3-31.
//  Copyright (c) 2013年 Hurricane. All rights reserved.
//

#import "RealMessagePushView.h"
#import "SettingViewCell.h"

@interface RealMessagePushView ()

@end

@implementation RealMessagePushView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    firstSectionArray = [[NSMutableArray alloc] init];
    secondSectionArray = [[NSMutableArray alloc] init];
    dataArray = [[NSMutableArray alloc] init];
    firstSectionArray = [NSMutableArray arrayWithObjects:@"系统通知",@"新回复通知",@"版本更新", nil];
    [secondSectionArray addObject:@"通知接收时段"];
    [dataArray addObject:firstSectionArray];
    [dataArray addObject:secondSectionArray];
	// Do any additional setup after loading the view.
    mTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    mTableView.delegate = self;
    mTableView.dataSource = self;
    mTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:mTableView];
    
    //左按钮
    UIButton * lftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    lftButton.frame = CGRectMake(10, 7, 51, 30);
    [lftButton setBackgroundImage:[UIImage imageNamed:@"image_titlebar_back_button"] forState:UIControlStateNormal];
    [lftButton setBackgroundImage:[UIImage imageNamed:@"image_titlebar_back_button_pressed"] forState:UIControlStateSelected];
    [lftButton setTitle:@"设置" forState:UIControlStateNormal];
    lftButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [lftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [lftButton addTarget:self action:@selector(pressLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:lftButton];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    
    
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (0 == section) {
        NSString * str =@"消息类别";
        return str;
    }
    if (1 == section) {
        NSString * str =@"通知时段";
        return str;
    }
    return nil;
}

//设置底部title的位置
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 15;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}


-(void)pressLeftButton:(UIButton *)btn
{
    
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[dataArray objectAtIndex:section] count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [dataArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static  NSString * cellID = @"in_phase";
    SettingViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell  == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SettingViewCell" owner:self options:nil] lastObject];
    }
    cell.titleLabel.text = [[dataArray  objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    if (1 == indexPath.section && 0 == indexPath.row) {
        cell.subLabel.text = @"建议使用3G或Wi-Fi网络使用";
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone ;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
