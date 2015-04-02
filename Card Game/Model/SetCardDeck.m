//
//  SetDeck.m
//  Card Game
//
//  Created by Wesley on 2015-03-30.
//  Copyright (c) 2015 Wesley. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

-(instancetype)init
{
    self = [super init];
    
    if (self) {
        for (int i = 1; i <= 3; i++) {
            for (int j = 1; i <= 3; i++) {
                for (int k = 1; i <= 3; i++) {
                    SetCard *card = [[SetCard alloc] init];
                    card.number = i;
                    card.symbol = j;
                    card.shading = k;
                    [self addCard:card];
                }
            }
        }
    }
    return self;
}

@end
