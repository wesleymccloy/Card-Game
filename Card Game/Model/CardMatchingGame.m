//
//  BetterCardMatchingGame.m
//  Card Game
//
//  Created by Wesley on 2015-03-31.
//  Copyright (c) 2015 Wesley. All rights reserved.
//

#import "CardMatchingGame.h"

@implementation CardMatchingGame

- (instancetype) init //not sure if this is necessary
{
    self = [super init];
    return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 5;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index
{
    NSLog(@"running chooseCardAtIndex in BetterCardMatchingGame.m");
    Card *card = [self cardAtIndex:index];
    NSMutableArray *otherCards = [[NSMutableArray alloc] init];
    int numberSelected = 0;
    
    NSLog(@"Card selected");
    
    if (!card.isMatched) {
        self.activityText = @"Card Selected";
        if (card.isChosen) {
            card.chosen = NO;
            NSLog(@"Card was already chosen");
            self.activityText = @"Card flipped over";
        } else if (!self.isMatchThree){
            //match against another card
            for (Card *otherCard in self.cards){
                if (otherCard.isChosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        NSLog(@"setting match");
                        self.activityText = [NSString stringWithFormat:@"Matched for %d points!", matchScore * MATCH_BONUS];
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        self.activityText = @"Mismatch penalty :(";
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            NSLog(@"setting chosen to YES");
            card.chosen = YES;
        } else {
            NSLog(@"entered 3 match mode");
            //for three matches:
            for (Card *otherCard in self.cards){
                if (otherCard.isChosen && !otherCard.isMatched){
                    [otherCards insertObject:otherCard atIndex:numberSelected];
                    numberSelected++;
                }
            }
            NSLog(@"number of chosen : %d", numberSelected);
            if (numberSelected >= 2){
                NSLog(@"matching three cards");
                //match the three cards:
                int matchScore = [card match:otherCards];
                if (matchScore) {
                    //set to matched and chosen
                    self.score += matchScore * MATCH_BONUS;
                    NSLog(@"three way match!");
                    self.activityText = [NSString stringWithFormat:@"Matched for %d points!", matchScore * MATCH_BONUS];
                    card.matched = YES;
                    for(Card *individualCard in otherCards) {
                        individualCard.matched = YES;
                    }
                    
                } else {
                    NSLog(@"failed to match :(");
                    self.activityText = @"Mismatch penalty :(";
                    //set to not matched and not chosen + penalty
                    self.score -= MISMATCH_PENALTY;
                    for (Card *individualCard in otherCards) {
                        NSLog(@"should be setting the cards chosen to NO");
                        individualCard.chosen = NO;
                    }
                }
            }
            self.score -= COST_TO_CHOOSE;
            NSLog(@"setting chosen to YES");
            card.chosen = YES;
        }
    }
}


@end
