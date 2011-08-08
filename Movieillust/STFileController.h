//
//  FileList.h
//  FasooDRMViewer
//
//  Created by Danny Yoon on 11. 1. 26..
//  Copyright 2011 Fasoo.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface STFileController : UITableViewController {
	NSMutableArray *_fileList;
	NSString *_selectedFile;
    NSString *_directoryPath;
}

- (id) initWithDirectory:(NSSearchPathDirectory)directory style:(UITableViewStyle)style;

- (void)reloadList;
- (NSString*)getFilePath:(NSString*)fileName;
- (BOOL)deleteFile:(NSString*)fileName;

@end
