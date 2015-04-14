//
//  BetterPlayingCardGameViiewControllerViewController.m
//  Card Game
//
//  Created by Wesley on 2015-03-31.
//  Copyright (c) 2015 Wesley. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (instancetype) init
{
    self = [super init];
    return self;
}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (CardMatchingGame *)createGame
{
       return[[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                     usingDeck:[self createDeck]];
}


- (UIColor *)colorForCard:(Card *)card
{
    return ([card.contents containsString:@"♥︎"] || [card.contents containsString:@"♦︎"]) ? [UIColor redColor] : [UIColor blackColor];
}

- (IBAction)modeSelectorSegmentedControl:(UISegmentedControl *)sender { //can I put this in subclass somehow?
    //self.game.MatchThree  = [sender selectedSegmentIndex];
  //  self.activityLabel.text = self.game.isMatchThree ? @"Match Three mode selected" : @"Match Two mode selected";
}

@end
