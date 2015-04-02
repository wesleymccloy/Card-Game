//
//  CardMatchingGame.h
//  Card Game
//
//  Created by Wesley on 2015-03-13.
//  Copyright (c) 2015 Wesley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject


// designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, getter=isMatchThree) BOOL MatchThree; //should subclass
@property (strong, nonatomic) NSString *activityText;
@end
