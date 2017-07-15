//
//  UIWebView+ToFile.m
//  UIWebViewToFile
//
//  Created by lyg on 2017/7/15.
//  Copyright © 2017年 lyg. All rights reserved.
//

#import "UIWebView+ToFile.h"

@implementation UIWebView (ToFile)

- (UIImage *)imageRepresentation {
    
    UIScrollView *scrollView = self.scrollView;
    CGPoint savedContentOffset = scrollView.contentOffset;
    CGRect savedFrame = scrollView.frame;
    
    scrollView.frame = CGRectMake(0, scrollView.frame.origin.y, scrollView.contentSize.width, scrollView.contentSize.height);
    UIGraphicsBeginImageContextWithOptions(scrollView.contentSize, YES, 0.0); //currentView 当前的view  创建一个基于位图的图形上下文并指定大小为
    [scrollView.layer renderInContext:UIGraphicsGetCurrentContext()];//renderInContext呈现接受者及其子范围到指定的上下文
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();//返回一个基于当前图形上下文的图片
    
    scrollView.contentOffset = savedContentOffset;
    scrollView.frame = savedFrame;
    UIGraphicsEndImageContext();
    
    return image;

}
@end
