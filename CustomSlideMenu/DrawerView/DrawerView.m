//
//  DrawerView.m
//  CustomSlideMenu
//
//  Created by Rana on 6/19/16.
//  Copyright © 2016 Rana. All rights reserved.
//

#import "DrawerView.h"
#import "UIImage+ResizeImage.h"

@implementation DrawerView


- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"awakeFromNib");
    // Initialization code
    //[self createVerticalScroll];
}

- (void) initWithSlideMenu:(CGRect)rect
{
    UIView *menuBg = [[UIView alloc] initWithFrame:CGRectMake(rect.size.width*0.4, 0, rect.size.width*0.6, rect.size.height)];
    menuBg.backgroundColor = [UIColor colorWithRed:6.0/255.0 green:96.0/255.0 blue:168.0/255.0 alpha:1.0];
    [self addSubview:menuBg];
    
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, menuBg.bounds.size.width, 44)];
    title.backgroundColor = [UIColor clearColor];
    title.font = [UIFont fontWithName:@"SFUIText-Bold" size:16.0];
    title.text = @"Menu";
    title.textColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
    title.textAlignment = NSTextAlignmentCenter;
    [menuBg addSubview:title];
    
    UIImageView *setImage = [[UIImageView alloc] initWithFrame:CGRectMake(menuBg.bounds.size.width*0.3, (64 + 20), menuBg.bounds.size.width*0.4, menuBg.bounds.size.width*0.4)];
    setImage.image = [UIImage imageNamed:@"picture.jpg"];
    setImage.contentMode = UIViewContentModeScaleAspectFill;
    setImage.layer.cornerRadius = setImage.frame.size.height /2;
    setImage.layer.masksToBounds = YES;
    setImage.layer.borderColor = [UIColor whiteColor].CGColor;
    setImage.layer.borderWidth = 2.0;
    [menuBg addSubview:setImage];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, menuBg.bounds.size.height*0.27, menuBg.bounds.size.width, 20)];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"SFUIText-Bold" size:14.0];
    label.text = [@"mohammad rana" capitalizedString];
    label.numberOfLines =0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.textColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
    label.textAlignment = NSTextAlignmentCenter;
    [menuBg addSubview:label];
    
    NSArray *menuName = [NSArray arrayWithObjects:@"Setting",@"Package",@"About",@"Help",@"Log Out", nil];
    NSArray *image = [NSArray arrayWithObjects:@"Setting.png",@"Package icon.png",@"About Icon.png",@"Help Icon.png",@"Logout Icon.png", nil];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, menuBg.bounds.size.height*0.32, rect.size.width, rect.size.height - rect.size.height*0.4)];
    
    int buttonY = 30;
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, buttonY);
    
    int count = 5;
    for (int i = 0; i < count; i++)
    {
        UIView *listView = [[UIView alloc] initWithFrame:CGRectMake(0, buttonY , rect.size.width*0.6, 50)];
        listView.backgroundColor = [UIColor clearColor];
        [scrollView addSubview:listView];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, rect.size.width*0.6, 50)];
        button.tag = i;
        button.backgroundColor = [UIColor clearColor];
        [listView addSubview:button];
        buttonY = buttonY + listView.frame.size.height;
        [button addTarget:self action:@selector(selectedButton:) forControlEvents:UIControlEventTouchUpInside];
        [listView addSubview:button];
        
        UIImageView *setImage = [[UIImageView alloc] initWithFrame:CGRectMake(listView.bounds.size.width*0.32 - listView.bounds.size.height/4, listView.bounds.size.height/4, listView.bounds.size.height/2, listView.bounds.size.height/2)];
        setImage.image = [UIImage imageWithImage:[UIImage imageNamed:[image objectAtIndex:i]] convertToSize:CGSizeMake(listView.bounds.size.height/2, listView.bounds.size.height/2)];
        setImage.contentMode = UIViewContentModeScaleAspectFill;
        [button addSubview:setImage];
        
        if (i == 2) {
            setImage.frame = CGRectMake(listView.bounds.size.width*0.32 - listView.bounds.size.height/4, listView.bounds.size.height/4, listView.bounds.size.height/2.6, listView.bounds.size.height/2);
            setImage.image = [UIImage imageWithImage:[UIImage imageNamed:[image objectAtIndex:i]] convertToSize:CGSizeMake(listView.bounds.size.height/2.6, listView.bounds.size.height/2)];
        }
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(listView.bounds.size.width*0.3 + 40, listView.bounds.size.height/2 - 11 , listView.bounds.size.width*0.3, 22)];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont fontWithName:@"SFUIText-Bold" size:15.0];
        label.text = [menuName objectAtIndex:i];
        label.numberOfLines =0;
        label.lineBreakMode = NSLineBreakByWordWrapping;
        label.textColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
        label.textAlignment = NSTextAlignmentLeft;
        [listView addSubview:label];
    }
    
    UILabel *serverTime = [[UILabel alloc] initWithFrame:CGRectMake(0, menuBg.bounds.size.height - 60, menuBg.bounds.size.width, 20)];
    serverTime.backgroundColor = [UIColor clearColor];
    serverTime.font = [UIFont fontWithName:@"SFUIText-Bold" size:14.0];
    serverTime.text = @"Server Time: 10:00 AM";
    serverTime.textColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
    serverTime.textAlignment = NSTextAlignmentCenter;
    [menuBg addSubview:serverTime];
    
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, buttonY+20);
    scrollView.backgroundColor = [UIColor clearColor];
    [menuBg addSubview:scrollView];
}


- (void) selectedButton:(UIButton*)btn{
    NSLog(@"selectedButton");
    [btn setBackgroundColor:[UIColor whiteColor]];
    [self.delegate selectedIndex:btn.tag];
}

@end
