//
//  TViewController.m
//  UITest
//
//  Created by charles on 2021/1/7.
//  Copyright © 2021 charles. All rights reserved.
//

#import "TViewController.h"
#import "XWPresentOneTransition.h"

@interface TViewController () <UIViewControllerTransitioningDelegate>

@end

@implementation TViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transitioningDelegate = self;
        //为什么要设置为Custom，在最后说明.
        self.modalPresentationStyle = UIModalPresentationCustom;
    }
    return self;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    //这里我们初始化presentType
    return [XWPresentOneTransition transitionWithTransitionType:XWPresentOneTransitionTypePresent];
}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    //这里我们初始化dismissType
    return [XWPresentOneTransition transitionWithTransitionType:XWPresentOneTransitionTypeDismiss];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0, 00, 100, 100)];
    button.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)action {
    [self dismissViewControllerAnimated:YES completion:nil];
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
