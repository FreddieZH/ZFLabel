//
//  ZFLabel.h
//
//  Created by Zfan on 4/5/16.
//  Copyright © 2016 Zfan. All rights reserved.
//

#import <UIKit/UIKit.h>

/* TextAlignmentOption */
typedef NS_OPTIONS(NSInteger, ZFLabelTextAlignmentOption) {
    ZFLabelTextAlignmentLeft        =   0 << 0,
    ZFLabelTextAlignmentCenter      =   1 << 0,
    ZFLabelTextAlignmentRight       =   2 << 0,
    ZFLabelTextAlignmentJustified   =   3 << 0,
    ZFLabelTextAlignmentNatural     =   4 << 0,
    
    ZFLabelTextAlignmentMiddle      =   0 << 4,
    ZFLabelTextAlignmentTop         =   1 << 4,
    ZFLabelTextAlignmentBottom      =   2 << 4,
} NS_ENUM_AVAILABLE_IOS(6_0);

@interface ZFLabel : UILabel

@property (nonatomic, assign) ZFLabelTextAlignmentOption ZF_textAlignmentOption;

@end
