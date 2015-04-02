//
//  Deck.h
//  Card Game
//
//  Created by Wesley on 2015-03-10.
//  Copyright (c) 2015 Wesley. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void)addCard:(Card *)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card;

-(Card *)drawRandomCard;

@end
