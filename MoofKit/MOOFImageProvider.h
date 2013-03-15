//
//  MOOFStandardImageProvider.h
//  MoofKit
//
//  Created by Green2, David on 3/15/13.
//  Copyright (c) 2013 digital-worlds. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - Display Constants -

#define kDialogBorderTopWidth 8.0
#define kDialogBorderBottomWidth 8.0
#define kDialogBorderLeftWidth 8.0
#define kDialogBorderRightWidth 8.0
#define kDialogImageWidth 16.0
#define kDialogImageHeight 16.0


@interface MOOFImageProvider : NSObject
+(UIImage *)resizeableDialogBorderImage;
+(UIColor *)greyBackgroundPatternColor;
+(UIImage *)clarusImage;
@end
