//
//  HomeViewController.m
//  UMengDemo
//
//  Created by Marcus on 14-6-9.
//  Copyright (c) 2014年 Marcus.ji. All rights reserved.
//

#import "HomeViewController.h"
#import "UMSocial.h"

@interface HomeViewController ()<UMSocialUIDelegate>

@property (weak, nonatomic) IBOutlet UIButton *shareButton;

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                            bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)shareButtonPressedEventHandle:(id)sender {
    
//    使用这种方法有一个非常不好的地方，因为UMShareToQQ对应的分享Logo可能因为用户没有安装qq app导致这个Logo完全是一个空白
//
//    [UMSocialSnsService presentSnsIconSheetView:self
//                                         appKey:@"5395117356240b420e03ca2a"
//                                      shareText:@"你要分享的文字"
//                                     shareImage:[UIImage imageNamed:@"icon.png"]
//                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToQQ,UMShareToQzone,UMShareToDouban,UMShareToRenren,nil]
//                                       delegate:self];
//   [[UMSocialControllerService defaultControllerService] setShareText:@"分享内嵌文字" shareImage:[UIImage imageNamed:@"icon"] socialUIDelegate:self];        //设置分享内容和回调对象
    

}

-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}

@end
