//
//  VCImageShow.h
//  照片墙案例上
//
//  Created by zh dk on 2017/8/28.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCImageShow : UIViewController
//图像视图的tag
@property (nonatomic,assign) NSUInteger imageTag;
//图像对象
@property (nonatomic,retain) UIImage *image;
//图像视图对象
@property (nonatomic,retain) UIImageView *imageView;
@end
