//
//  ViewController.m
//  ResponderChainDemo
//
//  Created by issuser on 2018/1/16.
//  Copyright © 2018年 issuser. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "UIResponder+Router.h"

@interface ViewController () <UITableViewDataSource>
@property (nonatomic, strong) NSDictionary<NSString *,NSInvocation *> *eventStrategy;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    return cell;
}

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    NSInvocation *invocation = self.eventStrategy[eventName];
    [invocation setArgument:&userInfo atIndex:2];
    [invocation invoke];
    
    //如果要继续往上传递 则开启下面的语句
    //[super routerEventWithName:eventName userInfo:userInfo];
}

- (NSDictionary<NSString *, NSInvocation *> *)eventStrategy {
    if (_eventStrategy == nil) {
        _eventStrategy = @{
                           @"onBtn1Click":[self createInvocationWithSelector:@selector(onBtn1Click:)],
                           @"onBtn2Click":[self createInvocationWithSelector:@selector(onBtn2Click:)]
                           };
    }
    return _eventStrategy;
}

- (NSInvocation *)createInvocationWithSelector:(SEL)selector {
    NSMethodSignature *methodSign = [[self class] instanceMethodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSign];
    [invocation setTarget:self];
    [invocation setSelector:selector];
    
    return invocation;
}

- (void)onBtn1Click:(id)sender {
    NSLog(@"btn1 click");
}

- (void)onBtn2Click:(id)sender {
    NSLog(@"btn2 click");
}

@end
