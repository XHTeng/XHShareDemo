//
//  XHShareView.h
//  
//
//  Created by XHTeng on 15/6/29.
//  Copyright (c) 2015年 XHTeng. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger, ShareBtn) {
    SharePyQuan=0,
    ShareWeix,
    ShareMsg,
    ShareSina,
    ShareQQ,
    ShareQzone,
};


@protocol XHShareViewDelegate <NSObject>
-(void) XHDidClickShareBtn:(ShareBtn) type;
@end


@interface XHShareView : UIView
@property(nonatomic, weak) id<XHShareViewDelegate> delegate;
-(id) initWithFrame:(CGRect)frame;
@end
