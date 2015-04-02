//
//  MasterGame.m
//  Card Game
//
//  Created by Wesley on 2015-03-31.
//  Copyright (c) 2015 Wesley. All rights reserved.
//

#import "MasterGame.h"

@interface MasterGame()

@end

@implementation MasterGame

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if  (self)
    {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

- (void)chooseCardAtIndex:(NSUInteger)index //abstract for subclass to deal with
{
    NSLog(@"running chooseCardAtIndex in MasterGame.m");
}

@end
