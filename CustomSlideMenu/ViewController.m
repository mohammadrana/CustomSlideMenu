//
//  ViewController.m
//  CustomSlideMenu
//
//  Created by Rana on 6/19/16.
//  Copyright © 2016 Rana. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //DrawerView *viewFromNib = [[NSBundle mainBundle] loadNibNamed:@"DrawerView" owner:self options:nil].firstObject;
    DrawerView *viewFromNib = [[DrawerView alloc] init];
    [viewFromNib setFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [viewFromNib setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    viewFromNib.delegate = self;
    [self.view addSubview:viewFromNib];
    
    [viewFromNib initWithSlideMenu:self.view.frame];
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:0.5];
    [animation setType:kCATransitionPush];
    [animation setSubtype:kCATransitionFromRight];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    [[viewFromNib layer] addAnimation:animation forKey:nil];
}

- (void) selectedIndex:(NSInteger)index{
    NSLog(@"index  %ld", (long)index);
}


//-(void)menuSlideOut {
//    CATransition *animation = [CATransition animation];
//    [animation setDuration:0.5];
//    [animation setType:kCATransitionPush];
//    [animation setSubtype:kCATransitionFromLeft];
//    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
//    [[viewFromNib layer] addAnimation:animation forKey:nil];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
