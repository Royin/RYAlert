//
//  ViewController.m
//  RYAlert
//
//  Created by LRY on 2018/10/29.
//  Copyright © 2018年 LRY. All rights reserved.
//

#import "ViewController.h"
#import "RYAlertController.h"
#import "RYAlertView.h"
#import "BuyClaimAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}
- (IBAction)shoe:(id)sender {
    
//    RYAlertController *alert = [RYAlertController alertControllerWithTitle:@"温馨提示" message:@"您的账户可用余额不足" preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"cancle" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        
//    }];
//    
//    [alert addAction:cancle];
//    
//    [self presentViewController:alert animated:YES completion:^{
//        
//    }];
    
//    RYAlertView *alertView = [[RYAlertView alloc] initWithTitle:@"温馨提示" message:@"您的账号余额不足，请前往充值" detail:@"" action:@"前往充值" handler:^{
//
//        NSLog(@"handle action");
//    }];
//
//
//
//    [alertView setHandleButtonColor:[UIColor redColor]];
//    [alertView setHandleButtonWidth:180];
//    [alertView show];
    
    BuyClaimAlertView *buy = [[BuyClaimAlertView alloc] initWithTitle:@"购买待收债转" message:@"" detail:@"" action:@"立即购买" handler:^{
        NSLog(@"立即购买");
    }];
    
    [buy setHandleButtonColor:[UIColor redColor]];
    [buy setHandleButtonWidth:180];
    [buy show];
    
    
    
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
   

}


@end
