//
//  FirstViewController.m
//  SampleApp
//
//  Created by Alexander Gallego on 11/25/13.
//
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *web;

@end

@implementation FirstViewController
@synthesize web = _web;

- (void)viewDidLoad
{
    [super viewDidLoad];
  NSString *HTMLstringfromFile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"] encoding:NSUTF8StringEncoding error:nil];
  
  [self.web loadHTMLString:HTMLstringfromFile
                   baseURL:[NSURL URLWithString:@"http://static.yieldmo.com/"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
