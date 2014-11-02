//
//  ViewController.m
//  TestNu
//
//  Created by Maxwin on 11/2/14.
//  Copyright (c) 2014 Maxwin. All rights reserved.
//

#import "ViewController.h"
#import "Nu.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *nupath = [[NSBundle mainBundle] pathForResource:@"my" ofType:@"nu"];
    NSString *nustr = [NSString stringWithContentsOfFile:nupath encoding:NSUTF8StringEncoding error:NULL];
    NSLog(@"%@", nustr);
    if (nustr) {
        [[Nu sharedParser] parseEval:nustr];
    }

    [self foo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)foo
{
    NSLog(@"original foo");
}


@end
