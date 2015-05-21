//
//  SetCardGameViewController.m
//  Card Game
//
//  Created by Wesley on 2015-03-30.
//  Copyright (c) 2015 Wesley. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCardDeck.h"
#import "SetGame.h"

@interface SetCardGameViewController ()

@end

@implementation SetCardGameViewController

- (Deck *) createDeck
{
    return [[SetCardDeck alloc] init];
}

- (SetGame *)createGame
{
    return [[SetGame alloc] initWithCardCount:[self.cardButtons count]
                                    usingDeck: [self createDeck]];
}


@end
