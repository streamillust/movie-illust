//
//  FileList.m
//  FasooDRMViewer
//
//  Created by Danny Yoon on 11. 1. 26..
//  Copyright 2011 Fasoo.com. All rights reserved.
//

#import "STFileController.h"

@implementation STFileController

- (id) initWithDirectory:(NSSearchPathDirectory)directory style:(UITableViewStyle)style;
{
	self = [super initWithStyle:style];
	if (self != nil) {
        NSArray *dirs = NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES);
        _directoryPath = [[dirs objectAtIndex:0] retain];
        
        [self reloadList];
	}
    
	return self;
}
- (void)dealloc {
    if (_directoryPath) [_directoryPath release];
    if (_fileList) [_fileList release];
    [super dealloc];
}

- (void)reloadList
{
    if (_fileList) {
        [_fileList release];
    }
    
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:_directoryPath error:nil];
    
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString *preferInfoPath = [bundlePath stringByAppendingPathComponent:@"prefer-info.plist"];
    NSDictionary *preferInfoMap = [NSMutableDictionary dictionaryWithContentsOfFile:preferInfoPath];
    _fileList = [[[files pathsMatchingExtensions:[preferInfoMap objectForKey:@"Supported File Type"]] sortedArrayUsingSelector:@selector(compare:)] retain];
}

- (NSString*)getFilePath:(NSString*)fileName
{
    return [_directoryPath stringByAppendingPathComponent:fileName];
}

- (BOOL)deleteFile:(NSString*)fileName
{
	return [[NSFileManager defaultManager] removeItemAtPath:[self getFilePath:fileName] error:nil];
}


@end
