//
//  MasterCardGameViewController.h
//  Card Game
//
//  Created by Wesley on 2015-03-31.
//  Copyright (c) 2015 Wesley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "MasterGame.h"

@interface MasterCardGameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *activityLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (nonatomic, strong) MasterGame *game;
// protected
// for subclasses
- (Deck *)createDeck; //abstract method
- (MasterGame *)createGame; //abstract method
@end