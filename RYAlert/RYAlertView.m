//
//  RYAlertView.m
//  RYAlert
//
//  Created by LRY on 2018/10/29.
//  Copyright © 2018年 LRY. All rights reserved.
//

#import "RYAlertView.h"

@interface RYAlertView ()

@property (nonatomic, strong) UIView *backgroundLightGrayView;
@property (nonatomic, strong) UIView *alertView;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *msgLabel;
@property (nonatomic, strong) UILabel *detailLabel;

@property (nonatomic, strong) UIButton *handleButton;

@property (nonatomic, strong) UIButton *closeButton;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSString *detail;

@property (nonatomic, copy) void(^handle)(void);

@end

@implementation RYAlertView


-(instancetype)initWithTitle:(NSString *)title message:(NSString *)msg detail:(NSString *)detail action:(NSString *)action handler:(void(^)(void))handle {
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        
        if (title && title.length) {
            self.title = title;
        }
        
        if (msg && msg.length) {
            self.msg = msg;
        }
        
        if (detail && detail.length) {
            self.detail = detail;
        }
        
        if (action && action.length) {
            [self addHandleButtonWithTitle:action];
        }
        
        if (handle) {
            self.handle = handle;
        }
        
        [self addCloseButton];
    }
    
    return self;
}


-(UIView *)backgroundLightGrayView {
    if (!_backgroundLightGrayView) {
        _backgroundLightGrayView = [[UIView alloc] initWithFrame:self.bounds];
        _backgroundLightGrayView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
        [self addSubview:_backgroundLightGrayView];
        [self bringSubviewToFront:self.alertView];
    }
    
    return _backgroundLightGrayView;
}

-(UIView *)alertView {
    if (!_alertView) {
        _alertView = [[UIView alloc] init];
        _alertView.backgroundColor = [UIColor whiteColor];
        _alertView.frame = CGRectMake(0, 0, 300 * [UIScreen mainScreen].bounds.size.width / 375, 0);
        _alertView.layer.cornerRadius = 5;
        
        [self addSubview:_alertView];
    }
    
    return _alertView;
}

-(void)addCloseButton {
    if (!_closeButton) {
        _closeButton = [[UIButton alloc] initWithFrame:CGRectMake(self.alertView.bounds.size.width - 45, 0, 45, 45)];
        [_closeButton setImage:[UIImage imageNamed:@"ry_alert_close"] forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(closeAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.alertView addSubview:_closeButton];
    }
}

-(void)closeAction:(UIButton *)button {
    [self hide];
}


#pragma mark - action button

-(void)addHandleButtonWithTitle:(NSString *)title {
    if (!_handleButton) {
        _handleButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 130, 34)];
        _handleButton.backgroundColor = [UIColor colorWithRed:2/255.0 green:155/255.0 blue:240/255.0 alpha:1.0];
        [_handleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _handleButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_handleButton addTarget:self action:@selector(handleAction:) forControlEvents:UIControlEventTouchUpInside];
        [_handleButton setTitle:title forState:UIControlStateNormal];
        _handleButton.layer.cornerRadius = 3;
        [self.alertView addSubview:_handleButton];
        
        [self updateSubviewsFrame];
    }
}


-(void)handleAction:(UIButton *)button {
    if (self.handle) {
        self.handle();
        [self hide];
    }
}

-(void)setHandleButtonColor:(UIColor *)color {
    if (_handleButton) {
        [_handleButton setBackgroundColor:color];
    }
}

-(void)setHandleButtonWidth:(CGFloat)width {
    if (_handleButton) {
        CGRect frame = _handleButton.frame;
        CGPoint center = _handleButton.center;
        frame.size.width = width;
        _handleButton.frame = frame;
        _handleButton.center = center;
    }
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
        _titleLabel.numberOfLines = 0;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        
        [self.alertView addSubview:_titleLabel];
    }
    
    return _titleLabel;
}

-(UILabel *)msgLabel {
    if (!_msgLabel) {
        _msgLabel = [[UILabel alloc] init];
        _msgLabel.font = [UIFont systemFontOfSize:15];
        _msgLabel.numberOfLines = 0;
        _msgLabel.textAlignment = NSTextAlignmentCenter;
        _msgLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        
        [self.alertView addSubview:_msgLabel];
    }
    
    return _msgLabel;
}

-(UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.font = [UIFont systemFontOfSize:12];
        _detailLabel.numberOfLines = 0;
        _detailLabel.textAlignment = NSTextAlignmentCenter;
        _detailLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0];
        
        [self.alertView addSubview:_detailLabel];
    }
    
    return _detailLabel;
}


-(void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
    
    [self updateSubviewsFrame];
}

-(void)setMsg:(NSString *)msg {
    _msg = msg;
    self.msgLabel.text = msg;
    
    [self updateSubviewsFrame];
}

-(void)setDetail:(NSString *)detail {
    _detail = detail;
    self.detailLabel.text = detail;
    
    [self updateSubviewsFrame];
}



-(CGFloat)label:(UILabel *)label heightWithWidth:(CGFloat)width {
    CGFloat height = 0;
    
    CGRect frame = [label.text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:label.font} context:nil];
    height = frame.size.height;
    
    return height;
}


// customer view

-(void)setCustomerView:(UIView *)customerView {
    _customerView = customerView;
    [self.alertView addSubview:_customerView];
    [self updateSubviewsFrame];
}

-(void)updateSubviewsFrame {
    UIEdgeInsets inset = UIEdgeInsetsMake(20, 30, 30, 30);
    
    CGFloat lastBottom = 0;
    
    CGFloat alertViewWidth = self.alertView.bounds.size.width;
    
    if (_titleLabel) {
        CGFloat titleWidth = alertViewWidth - inset.left - inset.right;
        CGFloat titleHeight = [self label:self.titleLabel heightWithWidth:titleWidth];
        self.titleLabel.frame = CGRectMake(inset.left, lastBottom + inset.top, titleWidth, titleHeight);
        lastBottom = CGRectGetMaxY(self.titleLabel.frame);;
    }
    
    if (_msgLabel) {
        CGFloat msgLabelWidth = alertViewWidth - inset.left - inset.right;
        CGFloat msgLabelHeight = [self label:self.msgLabel heightWithWidth:msgLabelWidth];
        self.msgLabel.frame = CGRectMake(inset.left, lastBottom + inset.top, msgLabelWidth, msgLabelHeight);
        lastBottom = CGRectGetMaxY(self.msgLabel.frame);
    }
    
    if (_customerView) {
        CGRect frame = self.customerView.frame;
        frame.origin.x = inset.left;
        frame.origin.y = lastBottom + 20;
        self.customerView.frame = frame;
        lastBottom = CGRectGetMaxY(self.customerView.frame);
    }
    
    if (_detailLabel) {
        CGFloat detailLabelWidth = alertViewWidth - 13 - 13;
        CGFloat detailLabelHeight = [self label:self.detailLabel heightWithWidth:detailLabelWidth];
        self.detailLabel.frame = CGRectMake(13, lastBottom + 15, detailLabelWidth, detailLabelHeight);
        lastBottom = CGRectGetMaxY(self.detailLabel.frame);
    }
    
    if (_handleButton) {
        CGSize handleButtonSize = self.handleButton.frame.size;
        self.handleButton.frame = CGRectMake((alertViewWidth-handleButtonSize.width) / 2, lastBottom + 25, handleButtonSize.width, handleButtonSize.height);
        lastBottom = CGRectGetMaxY(self.handleButton.frame);
    }
    
    CGFloat alertViewHeight = lastBottom + inset.bottom;
    CGSize alertViewSize = CGSizeMake(self.alertView.bounds.size.width, alertViewHeight);
    self.alertView.frame = CGRectMake(0, 0, alertViewSize.width, alertViewSize.height);
    
    CGPoint alertViewCenter = self.alertView.center;
    alertViewCenter = self.center;
    self.alertView.center = alertViewCenter;
}


// show alertView
-(void)show {
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow endEditing:YES];
    [keyWindow addSubview:self];
    [self animationAlert:self.alertView];
    self.backgroundLightGrayView.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        self.backgroundLightGrayView.alpha = 0.4;
    }];
}


// alert 动画
- (void)animationAlert:(UIView *)view
{
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.3;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.95f, 0.95f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.02f, 1.02f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.0f, @0.8f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [view.layer addAnimation:popAnimation forKey:nil];
    
}

// close alertView
-(void)hide {
    [UIView animateWithDuration:0.2 animations:^{
        self.backgroundLightGrayView.alpha = 0;
        self.alertView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
