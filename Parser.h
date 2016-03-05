//
//  Parser.h
//  Parser
//
//  Created by Ying Han on 3/5/16.
//  Copyright (c) 2016 Ying Han. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parser : NSObject

+ (instancetype)parserWithPath:(NSString *)path;
+ (instancetype)parserWithURL:(NSURL *)URL;

- (instancetype)initWithPath:(NSString *)path;
- (instancetype)initWithURL:(NSURL *)URL;

// Read methods
- (NSData *)dataWithError:(NSError **)error;
- (NSString *)contentWithError:(NSError **)error; // UTF-8 encoding
- (NSString *)contentWithEncoding:(NSStringEncoding)enc error:(NSError **)error;

// Write methods
- (BOOL)saveData:(NSData *)data error:(NSError **)error;
- (BOOL)saveContent:(NSString *)content error:(NSError **)error;
- (BOOL)saveContent:(NSString *)content encoding:(NSStringEncoding)enc error:(NSError **)error;

@end
