//
//  SetCard.m
//  Card Game
//
//  Created by Wesley on 2015-03-30.
//  Copyright (c) 2015 Wesley. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

-(void) setNumber:(NSUInteger)number
{
    if ([@[@1,@2,@3] containsObject:@(number)]) {
        _number = number;
    } else {
        _number = 0;
    }
}

-(void) setSymbol:(NSUInteger)symbol
{
    if ([@[@1,@2,@3] containsObject:@(symbol)]) {
        _symbol = symbol;
    } else {
        _symbol = 0;
    }
}

-(void) setShading:(NSUInteger)shading
{
    if ([@[@1,@2,@3] containsObject:@(shading)]) {
        _shading = shading;
    } else {
        _shading = 0;
    }
}

-(NSString *)contents
{
    return [NSString stringWithFormat:@"%d%d%d", self.number, self.symbol, self.shading];
}

- (int)match:(NSArray *)otherCards
{
    if ([otherCards count] == 2) {
        id firstCard = [otherCards firstObject];
        id secondCard = [otherCards lastObject];
        if ([firstCard isKindOfClass:[SetCard class]] && [secondCard isKindOfClass:[SetCard class]]) {
            SetCard *first = (SetCard *)firstCard;
            SetCard *second = (SetCard *)secondCard;
            if (first.number == second.number == self.number) {
            } else if (!(first.number == second.number || first.number == self.number || second.number == self.number)) {
            } else {
                return 0;
            }
            if (first.symbol == second.symbol == self.symbol) {
            } else if (!(first.symbol == second.symbol || first.symbol == self.symbol || second.symbol == self.symbol)) {
            } else {
                return 0;
            }
            if (first.shading == second.shading == self.shading) {
                return 1;
            } else if (!(first.shading == second.shading || first.shading == self.shading || second.shading == self.shading)) {
                return 1;
            } else {
                return 0;
            }
        }
    }
    return 0;
}


@end
