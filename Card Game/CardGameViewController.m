//
//  ViewController.m
//  Card Game
//
//  Created by Wesley on 2015-03-08.
//  Copyright (c) 2015 Wesley. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (strong,nonatomic) Deck *deck;
@property (nonatomic, strong) CardMatchingGame *game;  //can I put this in subclass somehow?
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *activityLabel;
@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]];
    }
    return _game;
}

- (Deck *)createDeck //abstract method
{
    return nil;//[[PlayingCardDeck alloc] init];
}

- (IBAction)modeSelectorSegmentedControl:(UISegmentedControl *)sender { //can I put this in subclass somehow?
    self.game.MatchThree  = [sender selectedSegmentIndex];
    self.activityLabel.text = self.game.isMatchThree ? @"Match Three mode selected" : @"Match Two mode selected";
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    unsigned long cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
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

- (UIColor *)colorForCard:(Card *)card
{
    return ([card.contents containsString:@"♥︎"] || [card.contents containsString:@"♦︎"]) ? [UIColor redColor] : [UIColor blackColor];
}

@end

