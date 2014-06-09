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
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"5395117356240b420e03ca2a"
                                      shareText:@"你要分享的文字"
                                     shareImage:[UIImage imageNamed:@"icon.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToQQ,UMShareToQzone,UMShareToDouban,UMShareToRenren,nil]
                                       delegate:self];

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
