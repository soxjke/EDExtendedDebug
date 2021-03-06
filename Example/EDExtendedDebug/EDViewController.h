//
//  EDViewController.h
//  EDExtendedDebug
//
//  Created by Alexey Fayzullov on 05/15/2015.
//  Copyright (c) 2014 Alexey Fayzullov. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EDViewController;

@interface EDObject : NSObject
{
    @public
    id _ivar;
}
@property (nonatomic, strong) EDViewController *controller;

@end

@interface EDViewController : UIViewController

@property (nonatomic, assign) SEL selector;
@property (nonatomic, strong) Class aClass;
@property (nonatomic, assign) CGPoint point;
@property (nonatomic, assign) CGRect rect;
@property (nonatomic, assign) CGSize size;

@property (nonatomic, assign) NSInteger anInteger;
@property (nonatomic, assign) CGFloat aFloat;

@property (nonatomic, strong) EDObject *object;

@end
