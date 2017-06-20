//
//  ViewController.m
//  Singleton
//
//  Created by 威盛电气 on 2017/6/20.
//  Copyright © 2017年 fzy. All rights reserved.
//

#import "ViewController.h"
#import "SecViewController.h"
#import "ShareManager.h"
#define Height self.view.frame.size.height
#define Width self.view.frame.size.width
@interface ViewController ()<UITextFieldDelegate>{
    UITextField *_Text;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _Text=[self getTextField:100 leftViewName:@"单例传回值:"];

self.view.backgroundColor=[UIColor whiteColor];


}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 申明初始化单例类的对象
    ShareManager *shareManager = [ShareManager shareUserInfo];
    
    _Text.text = shareManager.text;
}

-(UITextField *)getTextField:(CGFloat )y leftViewName:(NSString *)name{
    UITextField *  textField=[[UITextField alloc]initWithFrame:CGRectMake(20, y,Width-40, 45)];
    textField.layer.borderWidth=1.0f;
    [self.view addSubview:textField];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 45)];
    label.text=name;
    label.textAlignment=NSTextAlignmentCenter;
    label.font=[UIFont systemFontOfSize:14];
    label.adjustsFontSizeToFitWidth=YES;
    textField.leftView=label;
    textField.delegate=self;
    textField.leftViewMode=UITextFieldViewModeAlways;
    return textField;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    SecViewController *sec = [SecViewController new];
    [self.navigationController pushViewController:sec animated:YES];
}

@end
