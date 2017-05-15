//
//  DrawerView.h
//  CustomSlideMenu
//
//  Created by Rana on 6/19/16.
//  Copyright © 2016 Rana. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SlideMenuDelegate <NSObject>
- (void) selectedIndex:(NSInteger)index;
@end

@interface DrawerView : UIView
{
    UIScrollView *scrollView;
}

@property (nonatomic, weak) id <SlideMenuDelegate> delegate;

- (void) initWithSlideMenu:(CGRect)rect;

@end
