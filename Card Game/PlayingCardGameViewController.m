//
//  PlayingCardGameViewController.m
//  Card Game
//
//  Created by Wesley on 2015-03-25.
//  Copyright (c) 2015 Wesley. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

@end
