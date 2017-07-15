//
//  ViewController.m
//  UIWebViewToFile
//
//  Created by lyg on 2017/7/15.
//  Copyright © 2017年 lyg. All rights reserved.
//

#import "ViewController.h"
#import "UIWebView+ToFile.h"

@interface ViewController ()<UIWebViewDelegate>
{
    UIWebView *_webView;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"To image"
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(convertToImage:)];
    
    
    self.view.autoresizesSubviews = YES;
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.scalesPageToFit = YES;
    _webView.delegate = self;
    _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    [self.view addSubview:_webView];


}



- (void)convertToImage:(id)sender {
    UIImage *image = [_webView imageRepresentation];
    NSData *imageData = UIImagePNGRepresentation(image);
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *imagePath = [documentPath stringByAppendingPathComponent:@"temp.png"];
    BOOL result = [imageData writeToFile:imagePath  atomically:YES];
    NSLog(@"result:%d",result);
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}


- (void)image:(UIImage *)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo
{
    if (error){
        NSLog(@"保存失败");
    }else {
        NSLog(@"保存成功");
    }
}



#pragma mark - UIWebViewDelegate Methods
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [webView stringByEvaluatingJavaScriptFromString:@"document.body.innerText='Hello'"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
