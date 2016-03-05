//
//  Parser.m
//  Parser
//
//  Created by Ying Han on 3/5/16.
//  Copyright (c) 2016 Ying Han. All rights reserved.
//

#import "Parser.h"

@interface Parser ()

@property (nonatomic, strong) NSURL *url;

@end

@implementation Parser

#pragma mark Life Cycle

+ (instancetype)parserWithPath:(NSString *)path
{
    return [[Parser alloc] initWithPath:path];
}

+ (instancetype)parserWithURL:(NSURL *)URL
{
    return [[Parser alloc] initWithURL:URL];
}

- (instancetype)initWithPath:(NSString *)path
{
    self = [super init];
    if (self)
    {
        self.url = [NSURL fileURLWithPath:path];
    }
    
    return self;
}

- (instancetype)initWithURL:(NSURL *)URL
{
    self = [super init];
    if (self)
    {
        self.url = URL;
    }
    
    return self;
}

#pragma mark Read Methods

- (NSData *)dataWithError:(NSError **)error
{
    return [NSData dataWithContentsOfURL:self.url options:0 error:error];
}

- (NSString *)contentWithError:(NSError **)error
{
    return [NSString stringWithContentsOfURL:self.url encoding:NSUTF8StringEncoding error:error];
}

- (NSString *)contentWithEncoding:(NSStringEncoding)enc error:(NSError **)error
{
    return [NSString stringWithContentsOfURL:self.url encoding:enc error:error];
}

#pragma mark Write Methods

- (BOOL)saveData:(NSData *)data error:(NSError **)error
{
    return [data writeToURL:self.url options:0 error:error];
}

- (BOOL)saveContent:(NSString *)content error:(NSError **)error
{
    return [content writeToURL:self.url atomically:NO encoding:NSUTF8StringEncoding error:error];
}

- (BOOL)saveContent:(NSString *)content encoding:(NSStringEncoding)enc error:(NSError **)error
{
    return [content writeToURL:self.url atomically:NO encoding:enc error:error];
}

@end
