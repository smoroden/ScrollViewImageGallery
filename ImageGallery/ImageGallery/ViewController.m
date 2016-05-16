//
//  ViewController.m
//  ImageGallery
//
//  Created by Zach Smoroden on 2016-05-16.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // First image view
    UIImageView *imgV1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    imgV1.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.scrollView addSubview:imgV1];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imgV1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imgV1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imgV1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.view.frame.size.width]];

    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imgV1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];

    
    
    
    // Second image view
    UIImageView *imgV2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    imgV2.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.scrollView addSubview:imgV2];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imgV2 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:imgV1 attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imgV2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imgV2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.view.frame.size.width]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imgV2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
    
    
    // Third image view
    UIImageView *imgV3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-zoomed"]];
    imgV3.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:imgV3];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imgV3 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:imgV2 attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imgV3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imgV3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.view.frame.size.width]];

    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imgV3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:imgV3 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];

    //self.scrollView.contentSize = CGSizeMake(1000,1000);
}

-(void)viewDidAppear:(BOOL)animated {
    NSLog(@"%f, %f", self.scrollView.contentSize.height, self.scrollView.contentSize.width);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
