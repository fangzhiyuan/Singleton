//
//  SecViewController.m
//  Singleton
//
//  Created by 威盛电气 on 2017/6/20.
//  Copyright © 2017年 fzy. All rights reserved.
//

#import "SecViewController.h"
#import "ShareManager.h"
#define Height self.view.frame.size.height
#define Width self.view.frame.size.width
@interface SecViewController ()<UITextFieldDelegate>{
    UITextField *_Text;
    UIButton *_Btn;
}

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _Text=[self getTextField:100 leftViewName:@" info:"];
    
    self.view.backgroundColor=[UIColor whiteColor];
    _Btn=[self buttonInitWith:CGRectMake((Width-100)/2, 250, 100, 45) withTitle:@"确定" withBlock:^{
        
    }];
    _Btn.backgroundColor=[UIColor purpleColor];
    
}
-(void)buttonClick:(UIButton *)button{
    //反向传值
    ShareManager *shareManager = [ShareManager shareUserInfo];
    
    shareManager.text = _Text.text;
    
    [self.navigationController popToRootViewControllerAnimated: YES];
}
-(UIButton *)buttonInitWith:(CGRect)frame withTitle:(NSString *)name withBlock:(void(^)())block{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame=frame;
    [button setTitle:name forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    block();
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    return button;
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
