//
//  PrayAppTextView.h
//  ResizableTappableTextView
//
//  Created by Tapan on 27/03/14.
//  Copyright (c) 2014 Tapan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResizableTextView : UITextView<UITextViewDelegate,NSLayoutManagerDelegate>{

    
    
}

@property(nonatomic)float minimumFontSizeInPoints;
@property(nonatomic)float maximumFontSizeInPoints;



- (NSRange)rangeForUserParagraphAttributeChange;
-(int)fontSizeToFitText:(NSString*)text  withMinimumFontSize:(int)minimumFontSize andMaximumFontSize:(int)maximumFontSize;
-(BOOL)fontOfSize:(int)fontSize fitsText:(NSString*)text inSize:(CGSize)size;
-(CGSize)sizeForFontOfSize:(int)fontSize forText:(NSString*)text withEstimatedSize:(CGSize)size;

@end
