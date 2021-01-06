//
//  AViewController.m
//  UITest
//
//  Created by charles on 2021/1/7.
//  Copyright © 2021 charles. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton* view = [UIButton new];
    view.backgroundColor = [UIColor redColor];
    view.frame = CGRectMake(0, 100, 100, 100);
    [self.view addSubview:view];
    [view addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    
//    [UIView animateWithDuration:3 animations:^{
//        view.frame = CGRectMake(0, 300, 100, 100);
//    } completion:^(BOOL finished) {
//        [self.view removeFromSuperview];
//    }];
}


- (void)action {
    CATransition *animation = [CATransition animation];
    animation.duration = 1.0;
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromRight;
    [self.view.window.layer addAnimation:animation forKey:nil];
    [self dismissViewControllerAnimated:NO completion:nil];
}


- (void)dealloc {
    NSLog(@" av miss");
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
