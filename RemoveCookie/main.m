//
//  main.m
//  RemoveCookie
//
//  Created by Rob Mathers on 12-11-28.
//  Copyright (c) 2012 Rob Mathers. All rights reserved.
//

#import <Foundation/Foundation.h>

// NSLog replacement from http://stackoverflow.com/a/3487392/1376063
void IFPrint (NSString *format, ...) {
    va_list args;
    va_start(args, format);
    
    fputs([[[NSString alloc] initWithFormat:format arguments:args] UTF8String], stdout);
    fputs("\n", stdout);
    
    va_end(args);
}

int main(int argc, const char * argv[])
{
    NSString *urlSearchString;
    if (argc > 1) {
        urlSearchString = [[NSString alloc] initWithUTF8String:argv[1]];
    }
    else {
        IFPrint(@"No URL provided, quitting.");
        return 1;
    }
    
    NSHTTPCookieStorage *cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    
    NSString *filterString = [[NSString alloc] initWithFormat:@"domain ENDSWITH '%@'", urlSearchString];
    NSPredicate *filter = [NSPredicate predicateWithFormat:filterString];
    
    NSArray *matchedCookies = [cookieStorage.cookies filteredArrayUsingPredicate:filter];

    for (int i = 0; i < matchedCookies.count; i++) {
        [cookieStorage deleteCookie:[matchedCookies objectAtIndex:i]];
    }

    IFPrint(@"Removed %li cookies", matchedCookies.count);
    return 0;
}

