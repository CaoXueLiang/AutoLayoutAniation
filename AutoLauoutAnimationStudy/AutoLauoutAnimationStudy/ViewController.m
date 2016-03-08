//
//  ViewController.m
//  AutoLauoutAnimationStudy
//
//  Created by 曹学亮 on 16/3/8.
//  Copyright © 2016年 xueliang cao. All rights reserved.
//

#import "ViewController.h"
#import "LoginPageAnimation.h"

@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *tipTopLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipBottomLabel;
@property (weak, nonatomic) IBOutlet UIImageView *phoneImage;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabelOne;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomLineWidth;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@end

@implementation ViewController

#pragma mark - LifeCycle Menthod
- (void)viewDidLoad {
    [super viewDidLoad];
    //使用自动布局的话尽量不要拉约束改变约束的大小，使用下面这种方法
    _tipTopLabel.transform = CGAffineTransformMakeTranslation(0, -200);
    _tipBottomLabel.transform = CGAffineTransformMakeTranslation(0, -200);
    _phoneImage.transform = CGAffineTransformMakeTranslation(-200, 0);
    _bottomLineWidth.constant = 0;
    [self.phoneTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [LoginPageAnimation registerButtonWidthAnimation:self.loginButton withView:self.view andProgress:0];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [LoginPageAnimation titleLabelAnimationWithLabel:_tipTopLabel withView:self.view];
    [LoginPageAnimation titleLabelAnimationWithLabel:_tipBottomLabel withView:self.view];
    [LoginPageAnimation phoneImageAnimationWithImage:_phoneImage withView:self.view];
    [LoginPageAnimation bottomLineAnimationWithConstaint:_bottomLineWidth withView:self.view];
    [LoginPageAnimation tipsLabelMaskAnimation:_bottomLabelOne withBeginTime:0];
    [LoginPageAnimation tipsLabelMaskAnimation:_bottomView withBeginTime:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - OverrideView Menthod
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark TextField Menthod
- (void) textFieldDidChange:(UITextField *) TextField{
    [LoginPageAnimation registerButtonWidthAnimation:self.loginButton withView:self.view andProgress:TextField.text.length/11.0];
    if (TextField.text.length == 11) {
        self.loginButton.userInteractionEnabled = YES;
    }else{
        self.loginButton.userInteractionEnabled = NO;
    }
}

#pragma mark - ButtonClicked Menthod
- (IBAction)loginIn:(id)sender {
    
}

@end
