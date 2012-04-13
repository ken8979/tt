//
//  DetailViewController2.h
//  tt2
//
//  Created by taizo sato on 12/03/15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <mach/mach.h>

@class MasterViewController;
@class DetailViewController;

@interface DetailViewController2 : UIViewController{
    int myValue;
    IBOutlet UITableView *tableview;
}

- (void)memCheck;//メモリチェック

@end
