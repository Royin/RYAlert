//
//  BuyClaimAlertView.m
//  RYAlert
//
//  Created by LRY on 2018/10/29.
//  Copyright © 2018年 LRY. All rights reserved.
//

#import "BuyClaimAlertView.h"

@implementation BuyClaimAlertView


-(instancetype)initWithTitle:(NSString *)title message:(NSString *)msg detail:(NSString *)detail action:(NSString *)action handler:(void (^)(void))handle {
    self = [super initWithTitle:title message:msg detail:detail action:action handler:handle];
    if (self) {
        [self addClaimView];
    }
    
    return self;
}

-(void)addClaimView {
    
    CGFloat margin = 30;
    CGFloat claimViewWidth = 300 * [UIScreen mainScreen].bounds.size.width /  375 - 2*margin;
    CGFloat claimViewHeight = 180;
    UIView *claimView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, claimViewWidth, claimViewHeight)];
    self.customerView = claimView;
    
    CGFloat itemW = claimViewWidth / 2;
    
    // 转让金额
    CGSize amountLabelSize = [self sizeWithText:@"00000" fondSize:20];
    UILabel *amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, itemW, amountLabelSize.height)];
    amountLabel.font = [UIFont systemFontOfSize:20];
    amountLabel.textColor = [UIColor blackColor];
    amountLabel.textAlignment = NSTextAlignmentCenter;
    amountLabel.adjustsFontSizeToFitWidth = YES;
    [claimView addSubview:amountLabel];
    
    CGSize amountLabelTextSize = [self sizeWithText:@"转让金额(元)" fondSize:12];
    UILabel *amountTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(amountLabel.frame) + 10, itemW, amountLabelTextSize.height)];
    amountTextLabel.font = [UIFont systemFontOfSize:12];
    amountTextLabel.textColor = [UIColor blackColor];
    amountTextLabel.textAlignment = NSTextAlignmentCenter;
    [claimView addSubview:amountTextLabel];
  
    
    // 转让价格
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(itemW, 0, itemW, amountLabelSize.height)];
    priceLabel.font = [UIFont systemFontOfSize:20];
    priceLabel.textColor = [UIColor blackColor];
    priceLabel.textAlignment = NSTextAlignmentCenter;
    priceLabel.adjustsFontSizeToFitWidth = YES;
    [claimView addSubview:priceLabel];
    
    UILabel *priceTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(itemW, CGRectGetMaxY(amountLabel.frame) + 10, itemW, amountLabelTextSize.height)];
    priceTextLabel.font = [UIFont systemFontOfSize:12];
    priceTextLabel.textColor = [UIColor blackColor];
    priceTextLabel.textAlignment = NSTextAlignmentCenter;
    [claimView addSubview:priceTextLabel];
  
    
    // 账号可用余额
    CGFloat accountMargin = 0;
    CGSize accountSize = [self sizeWithText:@"账户可用余额：xxxx" fondSize:12];
    CGFloat accountW = claimViewWidth - 2*accountMargin;
    UILabel *accountLabel = [[UILabel alloc] initWithFrame:CGRectMake(accountMargin, CGRectGetMaxY(amountTextLabel.frame) + 30, accountW, accountSize.height)];
    accountLabel.textColor = [UIColor redColor];
    accountLabel.font = [UIFont systemFontOfSize:12];
    [claimView addSubview:accountLabel];
    
    // 购买金额
    UILabel *buyLable = [[UILabel alloc] initWithFrame:CGRectMake(accountMargin, CGRectGetMaxY(accountLabel.frame) + 5, accountW, 44)];
    buyLable.backgroundColor = [UIColor lightGrayColor];
    buyLable.font = [UIFont systemFontOfSize:20];
    buyLable.textColor = [UIColor blackColor];
    buyLable.textAlignment = NSTextAlignmentCenter;
    [claimView addSubview:buyLable];
    
    // 注
    CGSize noticeSize = [self sizeWithText:@"注：" fondSize:12];
    UILabel *noticeLabel = [[UILabel alloc] initWithFrame:CGRectMake(accountMargin, CGRectGetMaxY(buyLable.frame) + 10, noticeSize.width, noticeSize.height)];
    noticeLabel.font = [UIFont systemFontOfSize:12];
    noticeLabel.textColor = [UIColor lightGrayColor];
    [claimView addSubview:noticeLabel];
    
    UILabel *noticeTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(noticeLabel.frame), CGRectGetMinY(noticeLabel.frame), accountW - noticeSize.width, noticeSize.height * 2)];
    noticeTextLabel.font = [UIFont systemFontOfSize:12];
    noticeTextLabel.textColor = [UIColor lightGrayColor];
    [claimView addSubview:noticeTextLabel];
    
    
    amountLabel.text = @"544564";
    amountTextLabel.text = @"转让金额(元)";
    priceLabel.text = @"3465";
    priceTextLabel.text = @"转让价格元";
    accountLabel.text = @"账户可用余额：54545.00元";
    buyLable.text = @"购买金额：6000.00元";
    noticeLabel.text = @"注：";
    noticeTextLabel.text = [NSString stringWithFormat:@"原债权金额为xxx\n购买需花费xxxx"];
    noticeTextLabel.numberOfLines = 0;
    [noticeLabel sizeToFit];
    
}

-(CGSize)sizeWithText:(NSString *)text fondSize:(CGFloat)fontSize {
    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
    return size;
}


-(CGFloat)label:(UILabel *)label heightWithWidth:(CGFloat)width {
    CGFloat height = 0;
    
    CGRect frame = [label.text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:label.font} context:nil];
    height = frame.size.height;
    
    return height;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
