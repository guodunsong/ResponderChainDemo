//
//  TableViewCell.m
//  ResponderChainDemo
//
//  Created by issuser on 2018/1/16.
//  Copyright © 2018年 issuser. All rights reserved.
//

#import "TableViewCell.h"
#import "UIResponder+Router.h"

@interface TableViewCell()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _btn.layer.cornerRadius = 3.0;
    _btn.layer.borderWidth = 1;
    _btn.layer.borderColor = [UIColor orangeColor].CGColor;
    _btn.clipsToBounds = YES;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

- (IBAction)onBtn:(id)sender {
    [self routerEventWithName:@"onBtn1Click" userInfo:nil];
}


- (IBAction)onBtn2:(id)sender {
    [self routerEventWithName:@"onBtn2Click" userInfo:nil];
}

@end
