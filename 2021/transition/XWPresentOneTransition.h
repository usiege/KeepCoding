//
//  XWPresentOneTransition.h
//  UITest
//
//  Created by charles on 2021/1/7.
//  Copyright © 2021 charles. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XWPresentOneTransitionType) {
    XWPresentOneTransitionTypePresent = 0,//管理present动画
    XWPresentOneTransitionTypeDismiss//管理dismiss动画
};

NS_ASSUME_NONNULL_BEGIN

@interface XWPresentOneTransition : NSObject<UIViewControllerAnimatedTransitioning>
//根据定义的枚举初始化的两个方法
+ (instancetype)transitionWithTransitionType:(XWPresentOneTransitionType)type;
- (instancetype)initWithTransitionType:(XWPresentOneTransitionType)type;

@property (nonatomic, assign) XWPresentOneTransitionType type;

@end

NS_ASSUME_NONNULL_END
