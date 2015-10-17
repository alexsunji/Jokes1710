//
//  JokesViewController.m
//  Jokes
//
//  Created by Alex Sunji on 17.10.15.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import "JokesViewController.h"

#import "JokeDetailedViewController.h"

#import "Joke.h"

@interface JokesViewController ()<
UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *jokes;

@end



@implementation JokesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)
    sender{
    
    if ([segue.destinationViewController isKindOfClass:[JokeDetailedViewController class]]){
        JokeDetailedViewController *jvc = segue.destinationViewController;
        
        UITableViewCell *acell = sender;
        NSIndexPath *cellIndex = [self.tableView indexPathForCell:acell];
        
        Joke *joke = self.jokes[cellIndex.row];
        
        jvc.joke = joke;
    }
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.jokes.count == 0){
        [self updateData];
    }
}

//загрузим данные из сети
-(void)updateData {
    
    //1
   NSString *urlString = @"http://www.umori.li/api/get?site=bash.im&name=bash&num=20";
    
    
    
    
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    
    
    
    
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        id parsedData = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@",parsedData);
        [self parseData:parsedData];
        
    }] resume];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.jokes.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    Joke *joke = self.jokes[indexPath.row];
    cell.textLabel.text = joke.html;
    return cell;
}


-(void)parseData:(NSArray *)jokes {
    NSMutableArray *parsedJokes = [NSMutableArray new];
    
    for (NSDictionary *info in jokes) {
        Joke *joke = [Joke jokeFromDictionary:info];
        [parsedJokes addObject:joke];
    }
    self.jokes = parsedJokes;
    
    [[NSOperationQueue mainQueue]
     addOperationWithBlock:^{
         [self.tableView reloadData];
     }];
    
    [self.tableView reloadData];
    
}



@end
