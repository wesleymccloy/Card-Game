//
//  MasterCardGameViewController.m
//  Card Game
//
//  Created by Wesley on 2015-03-31.
//  Copyright (c) 2015 Wesley. All rights reserved.
//

#import "MasterCardGameViewController.h"
#import "MasterGame.h"

@interface MasterCardGameViewController ()
@property (strong,nonatomic) Deck *deck;
@end

@implementation MasterCardGameViewController

- (MasterGame *)game //hopefully abstract
{
    NSLog(@"should not be instantiating game in MasterVC");
    if (!_game) {
        _game = [self createGame];//[[MasterGame alloc] initWithCardCount:[self.cardButtons count]
                                                  //usingDeck:[self createDeck]];
    }
    return _game;
}

- (Deck *)createDeck //abstract method
{
    NSLog(@"should creating Deck in MasterVC");
    return nil;//[[PlayingCardDeck alloc] init];
}

- (Deck *)createGame //abstract method
{
    NSLog(@"should creating Deck in MasterVC");
    return nil;//[[PlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    unsigned long cardIndex = [self.cardButtons indexOfObject:sender];
    NSLog(@"about to chooseCardAtIndex");
    [self.game chooseCardAtIndex:cardIndex];
    NSLog(@"about to update UI");
    [self updateUI];
    
}

- (IBAction)dealButton:(id)sender {
    self.game = nil;
    [self updateUI];
}

- (void)updateUI
{
    for (UIButton *cardButton in self.cardButtons){
        unsigned long cardIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardIndex];
        
        [cardButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@", @"cardBack"]]
                              forState:UIControlStateNormal];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setImage:[self imageForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setTitleColor:[self colorForCard:card]
                         forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        
    }
    self.activityLabel.text = self.game.activityText;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)imageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"" : [NSString stringWithFormat:@"%@", @"waterlooLogo"]];
}

- (UIColor *)colorForCard:(Card *)card{ // abstract{
    // Need to make this part of subclass
    //return ([card.contents containsString:@"♥︎"] || [card.contents containsString:@"♦︎"]) ? [UIColor redColor] : [UIColor blackColor];
    return [UIColor blackColor];
}

@end
