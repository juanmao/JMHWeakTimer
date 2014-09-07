//
//  HZQViewController.m
//  JMHWeakTimerDemo
//
//  Created by juanmaohu on 9/7/14.
//  Copyright (c) 2014 juanmaohu. All rights reserved.
//

#import "HZQViewController.h"
#import "NSTimer+JMHWeak.h"

@interface HZQViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UILabel *countLable;
@property (nonatomic, assign) UInt32 count;

- (void)setUpView;
@end

@implementation HZQViewController

- (void)setUpView
{
    self.countLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    self.countLable.center = self.view.center;
    [self.view addSubview:self.countLable];
}

- (void)updateCount
{
    self.countLable.text = [NSString stringWithFormat:@"count:%@", @(self.count)];
    self.count++;
}

#pragma mark ViewController life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpView];
    
    __weak typeof(self) wself = self;
    self.timer = [NSTimer jmh_scheduledTimerWithTimeInterval:1 block:^{
        typeof(self) sself = wself;
        [sself updateCount];
    } repeats:YES];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
