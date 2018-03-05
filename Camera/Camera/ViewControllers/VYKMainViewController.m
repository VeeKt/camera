//
//  VYKMainViewController.m
//  Camera
//
//  Created by Victoria on 01.03.2018.
//  Copyright © 2018 Victoria. All rights reserved.
//

#import "VYKMainViewController.h"
#import "VYKStreamingViewController.h"

@interface VYKMainViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation VYKMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)createUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.button = [[UIButton alloc] initWithFrame:CGRectMake(20, self.view.frame.size.height/2 - 50, self.view.frame.size.width - 40, 100)];
    self.button.backgroundColor = [UIColor colorWithRed:0.5 green:0.1 blue:0.2 alpha:0.4];
    
    [self.button setTitle:@"START" forState:UIControlStateNormal];
    [self.button setTintColor:[UIColor whiteColor]];
    
    [self.button addTarget:self action:@selector(startStreaming) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)startStreaming
{
    VYKStreamingViewController *streamingViewController = [[VYKStreamingViewController alloc] init];
    
    [self.navigationController pushViewController:streamingViewController animated:YES];
}

@end
