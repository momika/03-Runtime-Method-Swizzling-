//
//  ViewController.m
//  03-Runtime-Method Swizzling(动态交换两个方法实现)
//
//  Created by vera on 16/6/30.
//  Copyright © 2016年 deli. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   // Method Swizzling 被称作runtime黑魔法
 
  
    /*
     Method Swizzling主要用途是：方法拦截(看不到源代码)。
     */
    
    //test1方法
    Method method1 = class_getInstanceMethod([self class], @selector(test1));
    //test2方法
    Method method2 = class_getInstanceMethod([self class], @selector(test2));
    
    //交换两个方法实现
    method_exchangeImplementations(method1, method2);
    
    
    [self test2];
}

- (void)test1
{
    NSLog(@"test1111方法调用了");
}

- (void)test2
{
    NSLog(@"test22222方法调用了");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
