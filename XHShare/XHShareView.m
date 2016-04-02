//
//  XHShareView.m
//
//
//  Created by XHTeng on 15/6/29.
//  Copyright (c) 2015年 XHTeng. All rights reserved.
//

#import "XHShareView.h"
#import "UIControl+Blocks.h"


@implementation XHShareView

-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        float btnHeight = 40;
        UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btnHeight, btnHeight)];
        [btn1 setImage:[UIImage imageNamed:@"share_pyquan"] forState:UIControlStateNormal];
        
        [btn1 addEventHandler:^(id sender) {
            [_delegate XHDidClickShareBtn:SharePyQuan];
        } forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn1];
        
        UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width*0.5-btnHeight*0.5, 0, btnHeight, btnHeight)];
        [btn2 setImage:[UIImage imageNamed:@"share_weixin"] forState:UIControlStateNormal];
        [btn2 addEventHandler:^(id sender) {
            [_delegate XHDidClickShareBtn:ShareWeix];
        } forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn2];
        
        UIButton *btn3 = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width-btnHeight, 0, btnHeight, btnHeight)];
        [btn3 setImage:[UIImage imageNamed:@"share_msg"] forState:UIControlStateNormal];
        [btn3 addEventHandler:^(id sender) {
            [_delegate XHDidClickShareBtn:ShareMsg];
        } forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn3];
        UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(0, self.frame.size.height-btnHeight, btnHeight, btnHeight)];
        [btn4 setImage:[UIImage imageNamed:@"share_sina"] forState:UIControlStateNormal];
        [btn4 addEventHandler:^(id sender) {
            [_delegate XHDidClickShareBtn:ShareSina];
        } forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn4];
        UIButton *btn5 = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width*0.5-btnHeight*0.5, self.frame.size.height-btnHeight, btnHeight, btnHeight)];
        [btn5 setImage:[UIImage imageNamed:@"share_qq"] forState:UIControlStateNormal];
        [btn5 addEventHandler:^(id sender) {
            [_delegate XHDidClickShareBtn:ShareQQ];
        } forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn5];
        UIButton *btn6 = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width-btnHeight, self.frame.size.height-btnHeight, btnHeight, btnHeight)];
        [btn6 setImage:[UIImage imageNamed:@"share_qzone"] forState:UIControlStateNormal];
        [btn6 addEventHandler:^(id sender) {
            [_delegate XHDidClickShareBtn:ShareQzone];
        } forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn6];
    }
    return self;
}
@end
