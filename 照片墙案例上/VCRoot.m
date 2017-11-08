//
//  VCRoot.m
//  照片墙案例上
//
//  Created by zh dk on 2017/8/28.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import "VCRoot.h"
#import "VCImageShow.h"

@interface VCRoot ()

@end

@implementation VCRoot

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"照片墙";
    
    //设置导航栏颜色
//    self.navigationController.navigationBar.barTintColor = [UIColor purpleColor];
    
    //隐藏导航栏
//    self.navigationController.navigationBarHidden = YES;
    
    UIScrollView *sv = [[UIScrollView alloc] init];
    //设置位置大小
    sv.frame =CGRectMake(5, 10, 300, 480);
    //设置画布大小
    sv.contentSize = CGSizeMake(300, 480*1.5);
    //打开交互事件
    sv.userInteractionEnabled = YES;
    
    //不显示滚动条
    sv.showsVerticalScrollIndicator = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    for (int i=0; i<15; i++) {
        NSString *strName = [NSString stringWithFormat:@"%d.jpg",i+1];
        UIImage *image = [UIImage imageNamed:strName];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(3+(i%3)*100,(i/3)*140+10, 90, 130);
        [sv addSubview:imageView];
        
        imageView.userInteractionEnabled =YES;
        
        //创建手势事件
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap:)];
        //单次点击
        tap.numberOfTapsRequired = 1;
        //单个手指
        tap.numberOfTouchesRequired = 1;
        
        [imageView addGestureRecognizer:tap];
        
        imageView.tag = 101+i;
    }
    
    [self.view addSubview:sv];
}
-(void) pressTap:(UITapGestureRecognizer*) tap
{
    //方法一:
//    UIImageView *imageView = (UIImageView*)tap.view;
//    //创建显示视图控制器
//    VCImageShow *imageShow = [[VCImageShow alloc] init];
//    //点击的图像视图赋值
//    imageShow.image = imageView.image;
//    //将控制器推出
//    [self.navigationController pushViewController:imageShow animated:YES];
    
    //方法二：
    UIImageView *imageView = (UIImageView*)tap.view;
    //    //创建显示视图控制器
    VCImageShow *imageShow = [[VCImageShow alloc] init];
    
    imageShow.imageTag = imageView.tag;
    [self.navigationController pushViewController:imageShow animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
