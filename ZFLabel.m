//
//  ZFLabel.m
//
//  Created by Zfan on 4/5/16.
//  Copyright © 2016 Zfan. All rights reserved.
//

#import "ZFLabel.h"

const ZFLabelTextAlignmentOption refHorizonOption = ZFLabelTextAlignmentLeft
                                                    | ZFLabelTextAlignmentCenter
                                                    | ZFLabelTextAlignmentRight
                                                    | ZFLabelTextAlignmentNatural
                                                    | ZFLabelTextAlignmentJustified;

const ZFLabelTextAlignmentOption refVerticalOption = ZFLabelTextAlignmentMiddle
                                                    | ZFLabelTextAlignmentTop
                                                    | ZFLabelTextAlignmentBottom;

@implementation ZFLabel

- (void)setZF_textAlignmentOption:(ZFLabelTextAlignmentOption)ZF_textAlignmentOption {
    
    _ZF_textAlignmentOption = ZF_textAlignmentOption;
    switch (ZF_textAlignmentOption & refHorizonOption) {
        case ZFLabelTextAlignmentLeft:
        default:
            self.textAlignment = NSTextAlignmentLeft;
            break;
        case ZFLabelTextAlignmentCenter:
            self.textAlignment = NSTextAlignmentCenter;
            break;
        case ZFLabelTextAlignmentRight:
            self.textAlignment = NSTextAlignmentRight;
            break;
        case ZFLabelTextAlignmentJustified:
            self.textAlignment = NSTextAlignmentJustified;
            break;
        case ZFLabelTextAlignmentNatural:
            self.textAlignment = NSTextAlignmentNatural;
            break;
    }
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    
    CGRect rect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    return rect;
}

- (void)drawTextInRect:(CGRect)rect {
    
    [super drawTextInRect:[self calculateTextRectWithRect:rect]];
}

#pragma mark- Calculate the Text Rect
- (CGRect)calculateTextRectWithRect:(CGRect)rect {
    
    CGRect calRect = rect;
    CGSize fitSize = [self sizeThatFits:rect.size];
    
    switch (self.ZF_textAlignmentOption & refVerticalOption) {
        case ZFLabelTextAlignmentTop:
            calRect = CGRectMake(0, 0, self.bounds.size.width, fitSize.height);
            break;
        case ZFLabelTextAlignmentBottom:
            calRect = CGRectMake(0, rect.size.height - fitSize.height, self.bounds.size.width, fitSize.height);
            break;
        case ZFLabelTextAlignmentMiddle:
        default:
            break;
    }
    
    return calRect;
}

@end
