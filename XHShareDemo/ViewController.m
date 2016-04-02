//
//  ViewController.m
//  XHShareDemo
//
//  Created by craneteng on 16/3/31.
//  Copyright © 2016年 craneteng. All rights reserved.
//

#import "ViewController.h"
#import "XHShareView.h"
#import "OpenShareHeader.h"
#import <MessageUI/MessageUI.h>


@interface ViewController ()<XHShareViewDelegate,MFMessageComposeViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGFloat viewHight = 120;
    
    UILabel *sao = [[UILabel alloc]init];
    sao.textColor = [UIColor redColor];
    sao.frame = CGRectMake((size.width - 100) * 0.5, 30, 100,100);
    sao.text = @"扫描二维码";
    [self.view addSubview:sao];
    
    UIImageView *QRcode = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2"]];
    QRcode.frame = CGRectMake(size.width * 0.1, 100, size.width * 0.8, size.width * 0.8);
    [self.view addSubview:QRcode];
    
    UILabel *share = [[UILabel alloc]init];
    share.textColor = [UIColor blueColor];
    share.frame = CGRectMake((size.width - 70) * 0.5, CGRectGetMaxY(QRcode.frame) , 70,70);
    share.text = @"或分享至";
    [self.view addSubview:share];
    
    XHShareView *shareView = [[XHShareView alloc] initWithFrame:CGRectMake(size.width * 0.1 , size.height - viewHight - 20, size.width * 0.8, viewHight)];
    shareView.delegate = self;
    [self.view addSubview:shareView];
}

#pragma mark -- XHShareViewDelegate
- (void) XHDidClickShareBtn:(ShareBtn)type{
    switch (type) {
        case SharePyQuan:{
            // 分享到朋友圈
            [self pyqClick];
            break;
        }
        case ShareWeix:{
            [self wxFriendClick];
            // 发给微信好友
            break;
        }case ShareMsg:{
            // 点击了短信
            [self sendMessage];
            break;
        }case ShareSina:{
            // 分享到微博
            [self sinaWBClick];
            break;
        }case ShareQQ:{
            // 发给QQ好友
            [self qqFriend];
            break;
        }case ShareQzone:{
            // 分享到QQ空间
            [self qzone];
            break;
        }default:{
            NSLog(@"默认");
            break;
        }
    }
}

#pragma mark - 配置分享信息
- (OSMessage *)shareMessage {
    OSMessage *message = [[OSMessage alloc] init];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy年MM月dd日HH时mm分ss秒";
    NSString *now = [fmt stringFromDate:[NSDate date]];
    message.title = [NSString stringWithFormat:@"大鸟的分享，分享时间%@",now];
    message.image = [UIImage imageNamed:@"icon"];
    // 缩略图
    message.thumbnail = [UIImage imageNamed:@"psd"];
    message.desc = [NSString stringWithFormat:@"大鸟的分享，分享时间%@",now];
    message.link=@"http://www.jianshu.com/users/e944bed06906/latest_articles";
    return message;
}

#pragma mark - 分享到微博
- (void)sinaWBClick {
    OSMessage *message = [self shareMessage];
    [OpenShare shareToWeibo:message Success:^(OSMessage *message) {
        NSLog(@"分享到sina微博成功:\%@",message);
    } Fail:^(OSMessage *message, NSError *error) {
        NSLog(@"分享到sina微博失败:\%@\n%@",message,error);
    }];
}

#pragma mark - 分享给QQ好友
- (void)qqFriend {
    OSMessage *message = [self shareMessage];
    [OpenShare shareToQQFriends:message Success:^(OSMessage *message) {
        NSLog(@"分享到QQ好友成功:%@",message);
    } Fail:^(OSMessage *message, NSError *error) {
        NSLog(@"分享到QQ好友失败:%@\n%@",message,error);
    }];
    
}

#pragma mark - 分享到QQ空间
- (void)qzone{
    OSMessage *message = [self shareMessage];
    [OpenShare shareToQQZone:message Success:^(OSMessage *message) {
        NSLog(@"分享到QQ空间成功:%@",message);
    } Fail:^(OSMessage *message, NSError *error) {
        NSLog(@"分享到QQ空间失败:%@\n%@",message,error);
    }];
}

#pragma mark - 分享给微信好友
- (void)wxFriendClick{
    OSMessage *message = [self shareMessage];
    [OpenShare shareToWeixinSession:message Success:^(OSMessage *message) {
        NSLog(@"微信分享到会话成功：\n%@",message);
    } Fail:^(OSMessage *message, NSError *error) {
        NSLog(@"微信分享到会话失败：\n%@\n%@",error,message);
    }];
}

#pragma mark - 分享到朋友圈
- (void)pyqClick{
    OSMessage *message = [self shareMessage];
    [OpenShare shareToWeixinTimeline:message Success:^(OSMessage *message) {
        NSLog(@"微信分享到朋友圈成功：\n%@",message);
    } Fail:^(OSMessage *message, NSError *error) {
        NSLog(@"微信分享到朋友圈失败：\n%@\n%@",error,message);
    }];
}

#pragma mark - 发送短信
- (void)sendMessage{
    if( [MFMessageComposeViewController canSendText] ){
        MFMessageComposeViewController * controller = [[MFMessageComposeViewController alloc]init]; //autorelease];
        // 短信的接收人
        controller.recipients = nil;//[NSArray arrayWithObject:@""]
        controller.body = @"XHShareDemo 给您发送了一条短信，XHShareDemo 给您发送了一条短信，XHShareDemo 给您发送了一条短信，XHShareDemo 给您发送了一条短信。";
        controller.messageComposeDelegate = self;
        [self presentViewController:controller animated:YES completion:nil]; 
    }else{
        NSLog(@"您的设备没有发送短信功能");
    }
}

#pragma mark -- MFMessageComposeViewControllerDelegate

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [controller dismissViewControllerAnimated:NO completion:nil];
    
    switch (result) {
        case MessageComposeResultCancelled:
            NSLog(@"发送取消");
            break;
        case MessageComposeResultFailed:// send failed
            NSLog(@"发送失败");
            break;
        case MessageComposeResultSent:
            NSLog(@"发送成功");
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
