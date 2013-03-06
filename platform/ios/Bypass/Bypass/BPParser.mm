//
//  BPParser.m
//  Bypass
//
//  Created by Damian Carrillo on 2/28/13.
//  Copyright 2013 Uncodin, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "BPParser.h"
#import "BPDocumentPrivate.h"
#import "parser.h"

@implementation BPParser {
    Bypass::Parser _parser;
}

- (id)init
{
    self = [super init];
    
    if (self != nil) {
        _parser = Bypass::Parser();
    }
    
    return self;
}

- (BPDocument *)parse:(NSString *)markdown
{
    using namespace Bypass;
    
    const char *mstr = [markdown cStringUsingEncoding:NSUTF8StringEncoding];
    Document doc = _parser.parse(mstr);
    BPDocument *document = [[BPDocument alloc] initWithDocument:doc];
    
    return document;
}

@end
