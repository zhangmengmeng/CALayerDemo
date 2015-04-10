//
//  QYViewController.m
//  CALayerDemo
//
//  Created by qingyun on 15-4-2.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYViewController.h"
#import "QYLayer.h"

@interface QYViewController ()
@property (nonatomic, strong) CALayer *baseLayer;
@property (nonatomic, strong) CALayer *maskLayer;
@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _baseLayer = [CALayer layer];
    
    // 几何属性
    _baseLayer.bounds = CGRectMake(0, 0, 200, 300);
    _baseLayer.position = CGPointMake(150, 350);
    
    // 外观属性
    _baseLayer.backgroundColor = [UIColor greenColor].CGColor;
    
    [self.view.layer addSublayer:_baseLayer];
    
    // 创建并设置掩码层
    _maskLayer = [CALayer layer];
    _maskLayer.bounds = CGRectMake(0, 0, 100, 100);
    _maskLayer.position = CGPointMake(100, 150);
    _maskLayer.contents = (__bridge id)([UIImage imageNamed:@"testOpaque"].CGImage);
}



#pragma mark - button actions
- (IBAction)toggleRoundedCorner:(id)sender {
    if (_baseLayer.cornerRadius == 0) {
        _baseLayer.cornerRadius = 20;
    } else {
        _baseLayer.cornerRadius = 0;
    }
}
- (IBAction)toggleBorder:(id)sender {
    if (_baseLayer.borderWidth == 0) {
        _baseLayer.borderWidth = 5;
        _baseLayer.borderColor = [UIColor redColor].CGColor;
    } else {
        _baseLayer.borderWidth = 0;
    }
}
- (IBAction)toggleOpacity:(id)sender {
    if (_baseLayer.opacity == 1.0) {
        _baseLayer.opacity = 0.5;
    } else {
        _baseLayer.opacity = 1.0;
    }
}
- (IBAction)toggleShadow:(id)sender {
    if (_baseLayer.shadowOffset.width > 0) {
        _baseLayer.shadowOffset = CGSizeZero;
    } else {
        _baseLayer.shadowOffset = CGSizeMake(10, -10);
        _baseLayer.shadowOpacity = 1.0;
    }
}
- (IBAction)toggleMaskLayer:(id)sender {
    CALayer *maskLayer = _baseLayer.mask ? nil : _maskLayer;
    _baseLayer.mask = maskLayer;
}
- (IBAction)toggleSubLayer:(id)sender {
    static BOOL hasSubLayer = NO;
    if (hasSubLayer) {
        // 移除layer,并取消hasSubLayer标志位
        for (CALayer *layer in _baseLayer.sublayers) {
            if ([layer isKindOfClass:[QYLayer class]]) {
                [layer removeFromSuperlayer];
                hasSubLayer = NO;
            }
        }
    } else {
        // 创建layer，并添加到子layer，并设置hasSubLayer标志位
        QYLayer *layer = [QYLayer layer];
        layer.bounds = CGRectMake(0, 0, 100, 100);
        layer.position = CGPointMake(100, 200);
        [_baseLayer addSublayer:layer];
        // 手动让layer显示
        [layer setNeedsDisplay];
        NSLog(@"%@", _baseLayer.sublayers);
        hasSubLayer = YES;
    }
}


@end
