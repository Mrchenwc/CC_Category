//
//  UIScrollView+CCHeader.m
//  OTC
//
//  Created by JYF o1n 2019/3/5.
//  Copyright © 2019年 YGC. All rights reserved.
//

#import "UIScrollView+CCHeader.h"
#import <objc/runtime.h>

static const char DropDownGBViewKey = '\0';

@implementation UIScrollView (CCHeader)

-(UIColor *)dropDownGBColor{
    UIImageView *dropDownGBView=objc_getAssociatedObject(self, &DropDownGBViewKey);
    if(dropDownGBView)
        return dropDownGBView.backgroundColor;
    else
        return nil;
}
-(void)setDropDownGBColor:(UIColor *)dropDownGBColor{
    UIImageView *dropDownGBView=objc_getAssociatedObject(self, &DropDownGBViewKey);
    if(!dropDownGBView){
        dropDownGBView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 0)];
        dropDownGBView.backgroundColor=dropDownGBColor;
        [self addSubview:dropDownGBView];
        objc_setAssociatedObject(self, &DropDownGBViewKey, dropDownGBView, OBJC_ASSOCIATION_RETAIN);
        [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    }
}

-(UIImage *)dropDownGBImage{
    UIImageView *dropDownGBView=objc_getAssociatedObject(self, &DropDownGBViewKey);
    if(dropDownGBView)
        return dropDownGBView.image;
    else
        return nil;
}

-(void)setDropDownGBImage:(UIImage *)dropDownGBImage{
    UIImageView *dropDownGBView=objc_getAssociatedObject(self, &DropDownGBViewKey);
    if(!dropDownGBView)
    {
        dropDownGBView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 0)];
        dropDownGBView.image=dropDownGBImage;
        [self addSubview:dropDownGBView];
        objc_setAssociatedObject(self, &DropDownGBViewKey, dropDownGBView, OBJC_ASSOCIATION_RETAIN);
        [self addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    }
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if([keyPath isEqualToString:@"contentOffset"]){
        UIImageView *_dropDownGBView=objc_getAssociatedObject(self, &DropDownGBViewKey);
        if(_dropDownGBView){
            if(self.contentOffset.y<0)
                _dropDownGBView.frame=CGRectMake(0, self.contentOffset.y, self.bounds.size.width, fabs(self.contentOffset.y));
        }
    }
}
- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    UIImageView *dropDownGBView=objc_getAssociatedObject(self, &DropDownGBViewKey);
    if(dropDownGBView){
        objc_setAssociatedObject(self, &DropDownGBViewKey, nil, OBJC_ASSOCIATION_RETAIN);
        [self removeObserver:self forKeyPath:@"contentOffset"];
    }
    
}

@end
