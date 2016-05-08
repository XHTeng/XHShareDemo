demo地址：[下载地址](https://github.com/XHTeng/XHShareDemo)
openShare框架下载地址：[下载地址](https://github.com/100apps/openshare)
demo效果如下：![demo效果](http://upload-images.jianshu.io/upload_images/1385290-5b0e87412d3715b1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

有人会说，友盟辣么牛逼，为什么不集成友盟，或ShareSDK等等比较流行成熟的框架，博主亲自都集成了一遍，分析如下：
####这个框架有什么优势？
######1.轻巧
同样集成五个平台，友盟SDK的大小。。。自行加法，下面是各平台的SDK包的大小
![友盟SDK包大小](http://upload-images.jianshu.io/upload_images/1385290-ea4951970082c391.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
再看看openShare，完全不需要再集成各平台的SDK
![openShare大小](http://upload-images.jianshu.io/upload_images/1385290-a656013c3a7a50ff.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

######2.使用方便
简单到一句废话没有，把大象放冰箱，总共分三步：
 1. 创建一个对象
~~~
OSMessage *message = [[OSMessage alloc] init];
~~~

 2. 设置你要分享的信息
~~~
message.title = [NSString stringWithFormat:@"这里是滕先洪的分享";
 message.image = [UIImage imageNamed:@"icon"];
~~~

 3. 在适当的时候分享出去~！
~~~
OSMessage *message = [self shareMessage];
    [OpenShare shareToWeibo:message Success:^(OSMessage *message) {
        NSLog(@"分享到sina微博成功:\%@",message);
    } Fail:^(OSMessage *message, NSError *error) {
        NSLog(@"分享到sina微博失败:\%@\n%@",message,error);
    }];
~~~

######3.安全，非常适合集成到p2p等社交需求不高但要求安全的
没有一点多余的功能，是优点也是缺点，不能统计用户的分享，如果运营有统计需求的话就无法满足了，并且不能集成登陆，但是一些App不想让友盟知道分享的统计信息的时候就很有用~！

#####最后，如作者所说，有时间还是最好研究下各个厂商实现的应用程序间通信的规则，明白原理才是王道。
