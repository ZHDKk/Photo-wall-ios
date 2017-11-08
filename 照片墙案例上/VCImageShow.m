//
//  VCImageShow.m
//  照片墙案例上
//
//  Created by zh dk on 2017/8/28.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import "VCImageShow.h"
#import "VCImageShowNext.h"

@interface VCImageShow ()

@end

@implementation VCImageShow

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = [NSString stringWithFormat:@"视图%lu",_imageTag - 100];
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.edgesForExtendedLayout = UIRectEdgeBottom | UIRectEdgeLeft | UIRectEdgeRight;
    self.view.backgroundColor = [UIColor whiteColor];
    _imageView = [[UIImageView alloc] init];
    _imageView.frame = CGRectMake(0, 10, 320, 510);
    
    //方法一：
//    _imageView.image = _image;
    
    //方法三:
    _imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%lu.jpg",_imageTag-100]];
   
    
    //开启交互事件
    _imageView.userInteractionEnabled = YES;
    
    //创建一个左滑手势
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(pressTapShowNext:)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [_imageView addGestureRecognizer:leftSwipe];
    
    
    //创建一个右滑手势
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(pressTapShowNext:)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    [_imageView addGestureRecognizer:rightSwipe];
    
    //一个视图对象只能有一个跟视图
    [self.view addSubview:_imageView];
}

//实现左右切换图片函数
-(void) pressTapShowNext:(UISwipeGestureRecognizer*) swipe
{
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        UIImageView *imageView = (UIImageView*) swipe.view;
        VCImageShow *next = [[VCImageShow alloc] init];
        NSLog(@"当前图片的tag：%lu",_imageTag);
        next.imageTag = _imageTag+1;
        [self.navigationController pushViewController:next animated:YES];
    }
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        [self.navigationController popViewControllerAnimated:YES];
    }
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
