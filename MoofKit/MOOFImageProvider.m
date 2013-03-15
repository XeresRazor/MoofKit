//
//  MOOFStandardImageProvider.m
//  MoofKit
//
//  Created by Green2, David on 3/15/13.
//  Copyright (c) 2013 digital-worlds. All rights reserved.
//

#import "MOOFImageProvider.h"

static NSCache *_MOOFImageCache;

#define kClarusImageWidth 16.0
#define kClarusImageHeight 16.0

// Cached Image keys
static NSString *kDialogBorderImageKey = @"kDialogBorderImageKey";
static NSString *kGreyBackgroundPatterColorKey = @"kGreyBackgroundPatterColorKey";
static NSString *kClarusImageKey = @"kClarusImageKey";

@implementation MOOFImageProvider

+(NSCache *)imageCache {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_MOOFImageCache = [[NSCache alloc] init];
	});
	return _MOOFImageCache;
}


+(UIImage *)resizeableDialogBorderImage {
	UIImage *borderImage = [[self imageCache] objectForKey:kDialogBorderImageKey];
	if (!borderImage) {
		// Generate and cache the border image
		CGRect frameRect = CGRectMake(0.0, 0.0, kDialogImageWidth + 1.0, kDialogImageHeight + 1.0);
		UIGraphicsBeginImageContextWithOptions(frameRect.size, NO, 0.0);
		// Draw the 2 border lines
		UIBezierPath *outerPath = [UIBezierPath bezierPathWithRect:CGRectInset(frameRect, 2.0, 2.0)];
		UIBezierPath *innerPath = [UIBezierPath bezierPathWithRect:CGRectInset(frameRect, 7.0, 7.0)];
		[outerPath setLineWidth:4.0];
		[innerPath setLineWidth:2.0];
		[[UIColor whiteColor] setFill];
		[[UIColor blackColor] setStroke];
		[outerPath fill];
		[outerPath stroke];
		[innerPath stroke];
		borderImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		borderImage = [borderImage resizableImageWithCapInsets:UIEdgeInsetsMake(kDialogBorderTopWidth, kDialogBorderLeftWidth, kDialogBorderBottomWidth, kDialogBorderRightWidth)];
		[[self imageCache] setObject:borderImage forKey:kDialogBorderImageKey];
	}
	return borderImage;
}

+(UIColor *)greyBackgroundPatternColor {
	UIColor *bgColor = [[self imageCache] objectForKey:kGreyBackgroundPatterColorKey];
	if (!bgColor) {
		// Generate and cache the image
		UIGraphicsBeginImageContextWithOptions(CGSizeMake(4.0, 4.0), NO, 0.0);
		
		// Fill the background
		UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0.0, 0.0, 4.0, 4.0)];
		[[UIColor whiteColor] setFill];
		[path fill];
		
		// Draw the two "pixels"
		path = [UIBezierPath bezierPathWithRect:CGRectMake(0.0, 0.0, 2.0, 2.0)];
		[[UIColor blackColor] setFill];
		[path fill];
		path = [UIBezierPath bezierPathWithRect:CGRectMake(2.0, 2.0, 2.0, 2.0)];
		[[UIColor blackColor] setFill];
		[path fill];
		
		UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		bgColor = [UIColor colorWithPatternImage:image];
		[[self imageCache] setObject:bgColor forKey:kGreyBackgroundPatterColorKey];
	}
	return bgColor;
}

+(UIImage *)clarusImage {
	UIImage *clarusImage = [[self imageCache] objectForKey:kClarusImageKey];
	if (!clarusImage) {
		// Generate and cache the image
		UIGraphicsBeginImageContextWithOptions(CGSizeMake(kClarusImageWidth, kClarusImageHeight), NO, 0.0);
		
		// Draw the Clarus bitmap
		
		clarusImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		[[self imageCache] setObject:clarusImage forKey:kClarusImageKey];
	}
	return clarusImage;
}

@end
