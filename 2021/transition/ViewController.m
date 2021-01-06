//
//  ViewController.m
//  UITest
//
//  Created by charles on 2021/1/5.
//  Copyright © 2021 charles. All rights reserved.
//

#import "ViewController.h"
#import "TViewController.h"
#import "AViewController.h"
#import "CornerView.h"

@interface ViewController () <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) CornerView* cornerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _cornerView = [[CornerView alloc] initWithFrame:CGRectMake(100, 100, 200, 400)];
    [self.view addSubview:_cornerView];

    UIView* upView = [UIView new];
    upView.backgroundColor = [UIColor yellowColor];
    upView.frame = CGRectMake(0, 0, 100, 100);
    [_cornerView addSubview:upView];

    [_cornerView setNeedsDisplay];
    
    
    UIButton* button = [[UIButton alloc] initWithFrame:CGRectMake(0, 00, 100, 100)];
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
}

- (void)action {
    AViewController* av = [AViewController new];
    av.modalPresentationStyle = UIModalPresentationFullScreen;
    CATransition *animation = [CATransition animation];
    animation.duration = 1.0;
    animation.type = kCATransitionPush;
    animation.subtype = kCATransitionFromRight;
    [self.view.window.layer addAnimation:animation forKey:nil];
    [self presentViewController:av animated:NO completion:nil];
    
    return;
    TViewController* tv = [TViewController new];
//    [tv.view addSubview:av.view];
//    [tv addChildViewController:av];
//    tv.transitioningDelegate = self;
    static int style = 0;
//    tv.modalTransitionStyle = style++;
    NSLog(@"%d", style);
    tv.modalPresentationStyle = style++;
    [self presentViewController:tv animated:YES completion:nil];
}

- (void)dealloc {
    NSLog(@" show new");
}

@end
