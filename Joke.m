//
//  Joke.m
//  Jokes
//
//  Created by Alex Sunji on 17.10.15.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import "Joke.h"

@implementation Joke

+ (Joke *)
jokeFromDictionary:(NSDictionary *)info{
    
    Joke *aJoke = [Joke new];
    
    aJoke.url = info[@"link"];
    aJoke.sourceSite = info[@"desc"];
    aJoke.html = info[@"elementPureHtml"];
    
    return aJoke;
}

@end
