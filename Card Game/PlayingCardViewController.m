//
//  PlayingCardViewController.m
//  Card Game
//
//  Created by Wesley McCloy on 5/17/15.
//  Copyright (c) 2015 Wesley. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardView.h"

@interface PlayingCardViewController ()
@property (weak, nonatomic) IBOutlet PlayingCardView *playingCardView;

@end

@implementation PlayingCardViewController
- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    self.playingCardView.faceUp = !self.playingCardView.faceUp;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.playingCardView.rank = 13;
    self.playingCardView.suit = @"♥︎";
    self.playingCardView.faceUp = YES;
    [self.playingCardView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.playingCardView action:@selector(pinch:)]];
    [self.playingCardView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self.playingCardView action:@selector(pan:)]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
