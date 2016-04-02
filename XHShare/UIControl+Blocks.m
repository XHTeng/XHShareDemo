//
//  UIControl+Blocks.m
//
//  Created by XHTeng on 05/08/14.
//  Copyright (c) 2014 XHTeng. All rights reserved.
//

#import "UIControl+Blocks.h"

static char UIButtonHandlerKey;

@implementation UIControl (Blocks)

- (void)addEventHandler:(ActionBlock)handler forControlEvents:(UIControlEvents)controlEvents {
    objc_setAssociatedObject(self, &UIButtonHandlerKey, handler, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionHandler:) forControlEvents:controlEvents];
}


- (void)callActionHandler:(id)sender {
    ActionBlock handler = (ActionBlock)objc_getAssociatedObject(self, &UIButtonHandlerKey);
    if (handler) {
        handler(sender);
    }
}

@end
