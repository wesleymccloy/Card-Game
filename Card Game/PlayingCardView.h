//
//  PlayingCardView.h
//  Card Game
//
//  Created by Wesley McCloy on 5/17/15.
//  Copyright (c) 2015 Wesley. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView


@property (nonatomic) NSUInteger rank;
@property (nonatomic, strong) NSString *suit;
@property (nonatomic) BOOL faceUp;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;
- (void)pan:(UIPanGestureRecognizer *)gesture;

@end
