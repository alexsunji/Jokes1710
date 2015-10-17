//
//  JokeDetailedViewController.m
//  Jokes
//
//  Created by Alex Sunji on 17.10.15.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import "JokeDetailedViewController.h"

@interface JokeDetailedViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;



@end

@implementation JokeDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textView.text = self.joke.html;
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];}



@end
