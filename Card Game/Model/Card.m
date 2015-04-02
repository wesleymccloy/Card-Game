//
//  Card.m
//  Card Game
//
//  Created by Wesley on 2015-03-10.
//  Copyright (c) 2015 Wesley. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards){
        if ([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    }
    return score;
}

@end
