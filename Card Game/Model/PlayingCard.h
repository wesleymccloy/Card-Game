//
//  PlayingCard.h
//  Card Game
//
//  Created by Wesley on 2015-03-10.
//  Copyright (c) 2015 Wesley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;


+(NSArray *)validSuits;
+(NSUInteger)maxRank;

@end
