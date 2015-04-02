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

@end
