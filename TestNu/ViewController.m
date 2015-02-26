//
//  ViewController.m
//  TestNu
//
//  Created by Maxwin on 11/2/14.
//  Copyright (c) 2014 Maxwin. All rights reserved.
//

#import "ViewController.h"
#import "Nu.h"

#import <objc/message.h>

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
    
    NSMethodSignature *s = [self methodSignatureForSelector:@selector(viewDidAppear:)];
    
    NSLog(@"%@", s);
    
    Class cls = NSClassFromString(@"MyClass");
    if (cls) {
        id o = [[cls alloc] init];
        [o foo];
//        objc_msgSend(o, NSSelectorFromString(@"bar:"), 1, 2, 3);
        [o performSelector:NSSelectorFromString(@"bar:b:") withObject:@(1)];
        
        NSMethodSignature *sig = [NSMethodSignature signatureWithObjCTypes:"v@:i:i:i"];
        NSInvocation *inv = [NSInvocation invocationWithMethodSignature:sig];
        [inv setSelector:NSSelectorFromString(@"bar:b:")];
        [inv setTarget:o];
        
        int a = 1, b = 2, c = 3;
//        NSObject *obj = [NSObject new];
        [inv setArgument:&a atIndex:2]; //arguments 0 and 1 are self and _cmd respectively, automatically set by NSInvocation
        [inv setArgument:&b atIndex:3]; //arguments 0 and 1 are self and _cmd respectively, automatically set by NSInvocation
        [inv setArgument:&c atIndex:4]; //arguments 0 and 1 are self and _cmd respectively, automatically set by NSInvocation
        
        [inv invoke];
        
        objc_msgSend(o, NSSelectorFromString(@"bar:b:"), 1, 2, 3);
        
//        [o performSelector:NSSelectorFromString(@"hello:") withObject:@(10)];
    }
    NSLog(@"%@", cls);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)foo
{
    NSLog(@"original foo");
}

- (void)obar:(int)a b:(int)b
{
    NSLog(@"obar: %d,%d", a, b);
}
//- (void)forwardInvocation:(NSInvocation *)anInvocation
//{
//    id target = anInvocation.target;
//    SEL selector = anInvocation.selector;
//    NSLog(@"target: %@", target);
//    NSLog(@"selector: %@", NSStringFromSelector(selector));
//    NSUInteger argCnt = [[anInvocation methodSignature] numberOfArguments];
//    for (int i = 0; i < argCnt; ++i) {
//        int v;
//        [anInvocation getArgument:&v atIndex:i];
//        NSLog(@"%d", v);
//    }
//}
//
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
//{
//    return [NSMethodSignature signatureWithObjCTypes:"v:@"];
//}


@end
