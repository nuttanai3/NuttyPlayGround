//
//  ViewController.m
//  NuttyPlayGround
//
//  Created by Nuttanai on 25/1/2564 BE.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mainBackGroundView, backGroundView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialBackGroundView];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [mainBackGroundView playAnimation];
}

- (void)viewDidDisappear:(BOOL)animated{
    [mainBackGroundView stopAnimation];
}

- (IBAction)playAction:(UIButton *)sender {
    PageListViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"PageListViewController"];
    vc.modalPresentationStyle = UIModalPresentationFormSheet;
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)initialBackGroundView {
    mainBackGroundView = [[MainBackGroundView alloc]initWithFrame: backGroundView.layer.bounds];
    [backGroundView addSubview: mainBackGroundView];
    [backGroundView setFrame:[backGroundView bounds]];
}

@end
