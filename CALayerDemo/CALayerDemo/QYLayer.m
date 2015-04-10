//
//  QYLayer.m
//  CALayerDemo
//
//  Created by qingyun on 15-4-2.
//  Copyright (c) 2015年 hnqingyun.com. All rights reserved.
//

#import "QYLayer.h"

@implementation QYLayer

- (void)drawInContext:(CGContextRef)ctx
{
    CGContextSetFillColorWithColor(ctx, [UIColor purpleColor].CGColor);
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 100, 50);
    CGContextAddLineToPoint(ctx, 0, 50);
    CGContextAddLineToPoint(ctx, 0, 0);
    
    CGContextFillPath(ctx);
}

@end
