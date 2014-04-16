//
//  ViewController.m
//  timer441
//
//  Created by Martin Zhu on 4/14/14.
//  Copyright (c) 2014 zhuwei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
- (IBAction)startStopButton:(id)sender;
@end
NSTimer *timer;

int tenMinutes = 600;

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.timerLabel setCenter:self.view.center];
    [self updateCounter];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) updateCounter {
    if (tenMinutes >= 300) {
        self.view.backgroundColor = [UIColor greenColor];
    } else if (tenMinutes >= 120) {
        self.view.backgroundColor = [UIColor yellowColor];
    } else {
        self.view.backgroundColor = [UIColor redColor];
    }
    int minutes = (tenMinutes % 3600) / 60;
    int seconds = (tenMinutes %3600) % 60;
    _timerLabel.text = [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
    tenMinutes--;
    
}

- (IBAction)startStopButton:(id)sender {
    if ([timer isValid]) {
        [timer invalidate];
    }
    tenMinutes = 600;
    self.view.backgroundColor = [UIColor greenColor];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateCounter) userInfo:nil repeats:YES];
    
}


@end
