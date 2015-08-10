//
//  ViewController.m
//  Pic13
//
//  Created by Mirza on 8/2/15.
//  Copyright (c) 2015 pic13. All rights reserved.
//

#import "ViewController.h"
#import "ViewController0.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize View1;
@synthesize View2;
@synthesize View3;
@synthesize View4;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *sv = [[UIScrollView alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
    
    
  /*
    ViewController0 *vc0 = [[ViewController0 alloc]initWithNibName:@"ViewController0" bundle:nil];
    ViewController1 *vc1 = [[ViewController1 alloc] initWithNibName:@"ViewController1" bundle:nil];
    ViewController2 *vc2 = [[ViewController2 alloc]initWithNibName:@"ViewController2" bundle:nil];
    ViewController3 *vc3 = [[ViewController3 alloc]initWithNibName:@"ViewController3" bundle:nil];
  */
    
    
   /*
    [self addChildViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"View1"]];
     [self.scrollView addSubview:[self.storyboard instantiateViewControllerWithIdentifier:@"View1"].view];
     [[self.storyboard instantiateViewControllerWithIdentifier:@"View1"] didMoveToParentViewController:self];
    
    CGRect frame1 = vc1.view.frame;
    frame1.origin.x = self.view.frame.size.width;
    [self.storyboard instantiateViewControllerWithIdentifier:@"View2"].view.frame = frame1;
    
    [self addChildViewController:vc1];
    [self.scrollView addSubview:vc1.view];
    [vc1 didMoveToParentViewController:self];
    
    
    
    CGRect frame2 = vc2.view.frame;
    frame2.origin.x = self.view.frame.size.width *2;
    vc2.view.frame = frame2;
    
    [self addChildViewController:vc2];
    [self.scrollView addSubview:vc2.view];
    [vc2 didMoveToParentViewController:self];
    
    CGRect frame3 = vc3.view.frame;
    frame3.origin.x = self.view.frame.size.width*3;
    vc3.view.frame = frame3;
    
    [self addChildViewController:vc3];
    [self.scrollView addSubview:vc3.view];
    [vc3 didMoveToParentViewController:self];
    
    */
    [self addChildViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"View1"]];
    [self addChildViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"View2"]];
    [self addChildViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"View3"]];
    [self addChildViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"View4"]];
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width *4,self.view.frame.size.height+22);
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
