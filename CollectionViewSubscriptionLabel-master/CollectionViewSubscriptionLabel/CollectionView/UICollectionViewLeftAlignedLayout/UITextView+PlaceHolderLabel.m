//
//  UITextView+PlaceHolderLabel.m
//  IDoctor
//
//  Created by admin on 2020/4/18.
//  Copyright © 2020 iflytek. All rights reserved.
//

#import "UITextView+PlaceHolderLabel.h"


@implementation UITextView (PlaceHolderLabel)

- (void)addPlaceHolderLabelWith:(NSString *)String {
    // _placeholderLabel
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = String;
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = [UIColor lightGrayColor];
    [placeHolderLabel sizeToFit];
    [self addSubview:placeHolderLabel];
    [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    
}

@end
