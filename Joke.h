//
//  Joke.h
//  Jokes
//
//  Created by Alex Sunji on 17.10.15.
//  Copyright (c) 2015 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Joke : NSObject

@property (nonatomic, strong) NSString *url;
@property (nonatomic,strong) NSString *html;
@property (nonatomic, strong) NSString *sourceSite;

+ (Joke *)jokeFromDictionary:
(NSDictionary *)info;

@end
