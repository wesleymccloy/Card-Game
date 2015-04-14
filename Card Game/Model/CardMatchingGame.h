//
//  BetterCardMatchingGame.h
//  Card Game
//
//  Created by Wesley on 2015-03-31.
//  Copyright (c) 2015 Wesley. All rights reserved.
//

#import "MasterGame.h"

@interface CardMatchingGame : MasterGame
@property (nonatomic, getter=isMatchThree) BOOL MatchThree;
@end
