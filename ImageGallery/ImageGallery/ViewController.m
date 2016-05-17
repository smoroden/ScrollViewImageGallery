//
//  ViewController.m
//  ImageGallery
//
//  Created by Zach Smoroden on 2016-05-16.
//  Copyright © 2016 Zach Smoroden. All rights reserved.
//

#import "ViewController.h"
#import "ImageDetailViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (nonatomic) UIImageView *imgV1;
@property (nonatomic) UIImageView *imgV3;
@property (nonatomic) UIImageView *imgV2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //self.pageControl.numberOfPages = 3;
    
    // First image view
    self.imgV1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    self.imgV1.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.scrollView addSubview:self.imgV1];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imgV1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeft multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imgV1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imgV1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.view.frame.size.width]];

    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imgV1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];

    
    
    
    // Second image view
    self.imgV2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-night"]];
    self.imgV2.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.scrollView addSubview:self.imgV2];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imgV2 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.imgV1 attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imgV2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    //[self.view addConstraint:[NSLayoutConstraint constraintWithItem:imgV2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.view.frame.size.width]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imgV2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeWidth multiplier:1 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imgV2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
    
    
    // Third image view
    self.imgV3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Lighthouse-zoomed"]];
    self.imgV3.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:self.imgV3];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imgV3 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.imgV2 attribute:NSLayoutAttributeRight multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imgV3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imgV3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:self.view.frame.size.width]];

    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imgV3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.imgV3 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeRight multiplier:1 constant:0]];

    //self.scrollView.contentSize = CGSizeMake(1000,1000);
}

-(void)viewDidAppear:(BOOL)animated {
    //NSLog(@"%f, %f", self.scrollView.contentSize.height, self.scrollView.contentSize.width);
}
- (IBAction)tapped:(UITapGestureRecognizer *)sender {
    
//    if([self.imgV1 pointInside:point withEvent:nil]) {
//        NSLog(@"point inside image1");
//    } else if ([self.imgV2 pointInside:point withEvent:nil]){
//        NSLog(@"point inside image2");
//    } else if ([self.imgV3 pointInside:point withEvent:nil]){
//        NSLog(@"point inside image3");
//    }

    UIScrollView *sv = sender.view;
    
    if(sv.contentOffset.x < 375) {
        NSLog(@"point inside image1");
        [self performSegueWithIdentifier:@"goToDetail" sender:self.imgV1];
    } else if (sv.contentOffset.x < 750) {
        NSLog(@"point inside image2");
        [self performSegueWithIdentifier:@"goToDetail" sender:self.imgV2];
    } else {
        NSLog(@"point inside image3");
        [self performSegueWithIdentifier:@"goToDetail" sender:self.imgV3];
    }
    
    
    
}
- (IBAction)pageTapped:(UIPageControl *)sender {
    if (sender.currentPage == 0) {
        
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if(scrollView.contentOffset.x < 375) {
        NSLog(@"point inside image1");
        self.pageControl.currentPage = 0;
    } else if (scrollView.contentOffset.x < 750) {
        NSLog(@"point inside image2");
        self.pageControl.currentPage = 1;
    } else {
        NSLog(@"point inside image3");
        self.pageControl.currentPage = 2;
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"goToDetail"]) {
        ImageDetailViewController *ivc = segue.destinationViewController;
        
        UIImageView *iv = sender;
        
//        ivc.imageView = [[UIImageView alloc] init];
        
        ivc.image = iv.image;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
