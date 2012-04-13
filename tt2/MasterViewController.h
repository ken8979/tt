//
//  MasterViewController.h
//  tt2
//
//  Created by ts on 12/02/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#include <mach/mach.h>

@class DetailViewController;
@class DetailViewController2;

@interface MasterViewController :UIViewController
{

    // ロケーションマネージャー
	CLLocationManager* locationManager;
    
	// 現在位置記録用
	CLLocationDegrees _longitude;
	CLLocationDegrees _latitude;
    
    
    IBOutlet UIButton *search_convini_btn;
    IBOutlet UIButton *search_gasolineStand_btn;
    IBOutlet UIButton *search_onsen_btn;    //"Onsen" is correct. "Spa","Hot spring" are incorrect.
    IBOutlet UIButton *search_hotel_btn;
    IBOutlet UIButton *search_ridersHouse_btn;
    IBOutlet UIButton *search_campsite_btn;
    IBOutlet UIButton *post_btn;//ポストボタン
    IBOutlet UIButton *post_btn2;//ポストボタン
    
    IBOutlet UILabel *output_lbl;
    IBOutlet UILabel *now_Poslbl;
    IBOutlet UITextField *memo_inputField;
    //IBOutlet UILabel *aitelbl;
    
    
}

@property (retain, nonatomic) DetailViewController *detailViewController;
@property (retain, nonatomic) DetailViewController2 *detailViewController2;

- (IBAction) post_btn_down:(id)sender;
- (IBAction) post_btn_down2:(id)sender;

- (IBAction) search_convini_btn_down:(id)sender;
- (IBAction) search_gasolineStand_btn_down:(id)sender;
- (IBAction) search_onsen_btn_down:(id)sender;
- (IBAction) search_hotel_btn_down:(id)sender;
- (IBAction) search_ridersHouse_btn_down:(id)sender;
- (IBAction) search_campsite_btn_down:(id)sender;
//- (IBAction) inputField;//テキストフィールド入力

- (void)searchOpenGooglemap:(NSString*)btnWord;
- (void)memCheck;//メモリチェック

@end
