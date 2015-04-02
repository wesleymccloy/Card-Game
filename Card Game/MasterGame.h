//
//  MasterGame.h
//  Card Game
//
//  Created by Wesley on 2015-03-31.
//  Copyright (c) 2015 Wesley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface MasterGame : NSObject
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;
@property (nonatomic, readwrite) NSInteger score;
@property (strong, nonatomic) NSMutableArray *cards; // of Card
@property (strong, nonatomic) NSString *activityText;
@end
