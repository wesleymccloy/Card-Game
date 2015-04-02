//
//  ViewController.h
//  Card Game
//
//  Created by Wesley on 2015-03-08.
//  Copyright (c) 2015 Wesley. All rights reserved.
//
// Abstract Class. Must implement methods as described below

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController

// protected
// for subclasses
- (Deck *)createDeck; //abstract method

@end

