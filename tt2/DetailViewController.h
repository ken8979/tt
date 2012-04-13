//
//  DetailViewController.h
//  tt2
//
//  Created by ts on 12/02/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#include <mach/mach.h>

@class MasterViewController;
@class DetailViewController2;

@interface DetailViewController : UIViewController{
    IBOutlet UILabel *output_lbl;
    IBOutlet UITextField *memo_inputField;

}

//@property (strong, nonatomic) DetailViewController2 *detailViewController2;

//    - (IBAction)mem_post_btn_down;

- (void)memCheck;//メモリチェック
//    - (IBAction)inputField;

@end
