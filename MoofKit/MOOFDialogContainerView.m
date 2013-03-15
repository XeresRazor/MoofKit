//
//  MOOFDialogContainerView.m
//  MoofKit
//
//  Created by Green2, David on 3/15/13.
//  Copyright (c) 2013 digital-worlds. All rights reserved.
//

#import "MOOFDialogContainerView.h"

@interface MOOFDialogContainerView ()
@property (nonatomic, readonly) UIImage *frameImage; // This holds a resizeable image that we use to draw the view border, it's generated dynamically the first time we need it
@property (nonatomic, strong) UIImageView *backgroundImageView;
@end

#pragma mark - Display Constants -

#define kDialogBorderTopWidth 8.0
#define kDialogBorderBottomWidth 8.0
#define kDialogBorderLeftWidth 8.0
#define kDialogBorderRightWidth 8.0
#define kDialogImageWidth 16.0
#define kDialogImageHeight 16.0


#pragma mark - Implementation -

@implementation MOOFDialogContainerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		[self calculateContentSize];
		self.backgroundImageView = [[UIImageView alloc] initWithFrame:self.bounds];
		self.backgroundImageView.image = self.frameImage;
		self.backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
		[self addSubview:self.backgroundImageView];
    }
    return self;
}

-(void)setFrame:(CGRect)frame {
	[super setFrame:frame];
	[self calculateContentSize];
	[self setNeedsLayout];
}

-(void)setContentSize:(CGSize)contentSize {
	_contentSize = contentSize;
	[self calculateFrame];
	[self setNeedsLayout];
}

-(void)calculateContentSize {
	// calculate the content size from the current frame
	_contentSize = CGSizeMake(self.frame.size.width - kDialogBorderLeftWidth - kDialogBorderRightWidth, self.frame.size.height - kDialogBorderTopWidth - kDialogBorderBottomWidth);
}

-(void)calculateFrame {
	// Calculate the frame from the current contentSize
	CGSize frameSize = CGSizeMake(_contentSize.width + kDialogBorderLeftWidth + kDialogBorderRightWidth, _contentSize.height + kDialogBorderTopWidth + kDialogBorderBottomWidth);
	CGRect frame = self.frame;
	frame.size = frameSize;
	self.frame = frame;
	[self setNeedsLayout];
}

static UIImage *_frameImage = nil;
-(UIImage *)frameImage {
	if (_frameImage == nil) {
		// Generate the frame image
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
		_frameImage = UIGraphicsGetImageFromCurrentImageContext();
		UIGraphicsEndImageContext();
		_frameImage = [_frameImage resizableImageWithCapInsets:UIEdgeInsetsMake(kDialogBorderTopWidth, kDialogBorderLeftWidth, kDialogBorderBottomWidth, kDialogBorderRightWidth)];
	}
	return _frameImage;
}

-(void)layoutSubviews {
	[super layoutSubviews];
	
}

@end
