//
//  RYAlertView.h
//  RYAlert
//
//  Created by LRY on 2018/10/29.
//  Copyright © 2018年 LRY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RYAlertView : UIView

@property (nonatomic, strong) UIView *customerView;

-(instancetype)initWithTitle:(NSString *)title message:(NSString *)msg detail:(NSString *)detail action:(NSString *)action handler:(void(^)(void))handle;

-(void)show;

-(void)setHandleButtonColor:(UIColor *)color;
-(void)setHandleButtonWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
