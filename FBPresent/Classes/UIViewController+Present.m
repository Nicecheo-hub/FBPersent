//
//  UIViewController+Present.m
//  chexiuxiu
//
//  Created by 乌巢科技 on 2019/10/21.
//  Copyright © 2019 waibao. All rights reserved.
//

#import "UIViewController+Present.h"

#import <objc/runtime.h>


@implementation UIViewController (Present)

+ (void)load{
    
    Method oldMethod = class_getInstanceMethod(self, @selector(presentViewController:animated:completion:));
    Method newMethod = class_getInstanceMethod(self, @selector(my_presentViewController:animated:completion:));
    method_exchangeImplementations(newMethod, oldMethod);

}


- (void)my_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    if (viewControllerToPresent.modalPresentationStyle == 1) {
        viewControllerToPresent.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    [self my_presentViewController:viewControllerToPresent animated:flag completion:completion];
}

@end
