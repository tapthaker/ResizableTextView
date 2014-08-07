//
//  PrayAppTextView.m
//  ResizableTappableTextView
//
//  Created by Tapan on 27/03/14.
//  Copyright (c) 2014 Tapan. All rights reserved.
//

#import "ResizableTextView.h"


@implementation ResizableTextView

-(void)awakeFromNib{
    [self commonInitialization];
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self commonInitialization];
    }
    
    return self;
}


-(void)commonInitialization{

    self.delegate=self;
    self.maximumFontSizeInPoints=41;
    self.minimumFontSizeInPoints=13;
    self.clipsToBounds=NO;
    self.textContainerInset=UIEdgeInsetsZero;

}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    NSString *textAfterChange = [textView.text stringByReplacingCharactersInRange:range withString:text];
    
    int fontSize = [self fontSizeToFitText:textAfterChange withMinimumFontSize:self.minimumFontSizeInPoints andMaximumFontSize:self.maximumFontSizeInPoints];
    
    self.font=[self.font fontWithSize:fontSize];
    
    return YES;
}


-(void)setText:(NSString *)text{

    [super setText:text];
    
    int fontSize = [self fontSizeToFitText:text withMinimumFontSize:self.minimumFontSizeInPoints andMaximumFontSize:self.maximumFontSizeInPoints];
    self.font=[self.font fontWithSize:fontSize];

}



-(CGSize)textContentSize{
    
    // Calculation and subtraction of magical fudge factor.
    UIEdgeInsets textContainerInsets = self.textContainerInset;
    UIEdgeInsets contentInsets = self.contentInset;
    
    CGSize textViewSize = self.frame.size;
    CGFloat leftRightPadding = textContainerInsets.left + textContainerInsets.right + self.textContainer.lineFragmentPadding * 2 + contentInsets.left + contentInsets.right;
    CGFloat topBottomPadding = textContainerInsets.top + textContainerInsets.bottom + contentInsets.top + contentInsets.bottom;
    
    textViewSize.width -= leftRightPadding;
    textViewSize.height -= topBottomPadding;
    
    return textViewSize;
}


-(int)fontSizeToFitText:(NSString*)text  withMinimumFontSize:(int)minimumFontSize andMaximumFontSize:(int)maximumFontSize{
    
    CGSize textViewSize = [self textContentSize];

    // resize the text to fit in the textView using an algorithm similar to binary search
    int fontSize;
    int maximumFontSizeToFitText=minimumFontSize;
    fontSize = (maximumFontSize+minimumFontSize)/2;
    
    
    
//     Binary Search like Algorithm
    while (minimumFontSize<=maximumFontSize){
        
        BOOL fitsText = [self fontOfSize:fontSize fitsText:text inSize:textViewSize];
        
        if (fitsText) {
            minimumFontSize=fontSize+1;
            
            if (fontSize>maximumFontSizeToFitText) {
                maximumFontSizeToFitText=fontSize;
            }
            
            
        }else{
            maximumFontSize=fontSize-1;
        }
        
        fontSize = (maximumFontSize+minimumFontSize)/2;
    
    }
    
    return maximumFontSizeToFitText;
    

//    NORMAL LOGIC - A bit slow.
//    for (int i=maximumFontSize;i>=minimumFontSize;i--) {
//        BOOL fitsText = [self font:fnt ofSize:fontSize fitsText:text inSize:textViewSize];
//        
//        if (fitsText) {
//            return i;
//        }
//        
//    }
//    
//    return minimumFontSize;


}

-(BOOL)fontOfSize:(int)fontSize fitsText:(NSString*)text inSize:(CGSize)size{
    
    CGSize textSize = [self sizeForFontOfSize:fontSize forText:text withEstimatedSize:size];
    return (textSize.height<=size.height);
}

-(CGSize)sizeForFontOfSize:(int)fontSize forText:(NSString*)text withEstimatedSize:(CGSize)size{
    
    UIFont *font = [self.font fontWithSize:fontSize];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
    NSDictionary *attributes = @{NSFontAttributeName: font,NSForegroundColorAttributeName:[UIColor whiteColor], NSParagraphStyleAttributeName : paragraphStyle};

    return [text boundingRectWithSize:CGSizeMake(size.width,CGFLOAT_MAX) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) attributes:attributes context:nil].size;
}

- (NSRange)rangeForUserParagraphAttributeChange{
    NSRange paragaphRange = [self.textStorage.string paragraphRangeForRange: self.selectedRange];
    return paragaphRange;
}






@end
