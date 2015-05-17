//
//  PlayingCardView.m
//  Card Game
//
//  Created by Wesley McCloy on 5/17/15.
//  Copyright (c) 2015 Wesley. All rights reserved.
//

#import "PlayingCardView.h"

@implementation PlayingCardView

- (void)setSuit:(NSString *)suit
{
    _suit = suit;
    [self setNeedsDisplay];
}

- (void)setRank:(NSUInteger)rank
{
    _rank = rank;
    [self setNeedsDisplay];
}

- (void)setFaceUp:(BOOL)faceUp
{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

- (void)pinch:(UIPinchGestureRecognizer *)gesture
{
    if ((gesture.state == UIGestureRecognizerStateChanged) || (gesture.state == UIGestureRecognizerStateEnded))
    {
        self.bounds = CGRectMake(0,0, self.bounds.size.width * gesture.scale, self.bounds.size.height * gesture.scale);
        gesture.scale = 1.0;
    }
}

- (void)pan:(UIPanGestureRecognizer *)gesture
{
    if ((gesture.state == UIGestureRecognizerStateChanged) || (gesture.state == UIGestureRecognizerStateEnded))
    {
        CGPoint point = [gesture locationInView:gesture.view];
        self.center = point;
    }
}

#define CONER_FONT_STANDARD_HEIGHT 180.0
#define CORNER_RADIUS 12.0

- (CGFloat)cornerScaleFactor { return self.bounds.size.height / CONER_FONT_STANDARD_HEIGHT; }
- (CGFloat)cornerRadius { return CORNER_RADIUS * [self cornerScaleFactor]; }
- (CGFloat)cornerOffset { return [self cornerRadius] / 3.0; }

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (self.faceUp) {
        UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[self cornerRadius]];
        
        [roundedRect addClip];
        [[UIColor whiteColor] setFill];
        UIRectFill(self.bounds);
        
        [[UIColor blackColor] setStroke];
        [roundedRect stroke];
        
        [self drawCorners];
    }
    
}

- (NSString *)rankAsString
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"][self.rank];
}

- (void)drawCorners
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    UIFont *cornerFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cornerFont = [cornerFont fontWithSize:cornerFont.pointSize * [self cornerScaleFactor]];
    
    NSAttributedString *cornerText = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n%@", [self rankAsString], self.suit] attributes:@{ NSFontAttributeName : cornerFont, NSParagraphStyleAttributeName : paragraphStyle}];
    CGRect textBounds;
    textBounds.origin = CGPointMake([self cornerOffset], [self cornerOffset]);
    textBounds.size = [cornerText size];
    [cornerText drawInRect:textBounds];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(context, M_PI);
    [cornerText drawInRect:textBounds];
    
    
}

- (void)setup
{
    self.backgroundColor = nil;
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
}

- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

@end
