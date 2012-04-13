//
//  DetailViewController.m
//  tt2
//
//  Created by ts on 12/02/27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"

#import "DetailViewController2.h"
//ここにDetailViewController.hのことも書かれている。
#import "MasterViewController.h"

@implementation DetailViewController

- (void)dealloc
{
    [super dealloc];
}

#pragma mark - Managing the detail item

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{

    //make post_button
    UIButton *post_btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    post_btn2.frame = CGRectMake(205, 85, 100, 30);
    [post_btn2 setTitle:@"投稿2" forState:UIControlStateNormal];
    // ボタンがタッチダウンされた時にhogeメソッドを呼び出す
    [post_btn2 addTarget:self action:@selector(post_btn_down2:)forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:post_btn2];
    //前回起動時入力文字をラベルに読み出し
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *imputed_Text = [ud stringForKey:@"IMPUT_TXT"];
    output_lbl.text = imputed_Text;
    memo_inputField.delegate = self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

//回転殺し
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return NO;
    }
}

//ナナビゲーションバーキャプション
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail1", @"Detail not View");
    }
    return self;
}
							
#pragma mark


//メモリ情報の表示
-(void)memCheck{
    struct task_basic_info t_info;
	mach_msg_type_number_t t_info_count = TASK_BASIC_INFO_COUNT;
    
	if (task_info(current_task(), TASK_BASIC_INFO,
				  (task_info_t)&t_info, &t_info_count)!= KERN_SUCCESS) {
		NSLog(@"%s(): Error in task_info(): %s",
			  __FUNCTION__, strerror(errno));
	}
    
	u_int rss = t_info.resident_size;
	NSLog(@"RSS: %0.1f MB", rss/1024.0/1024.0);
}

//フォーカスがとれたらキーボードが隠れる。（複数レイヤーにわたってUIオブジェクトがある時チェイン（レスポンダーが感知しない）に注意）
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	//UITouch* touch = [touches anyObject];
	//CGPoint pt = [touch locationInView:self];
    [memo_inputField resignFirstResponder];
    NSLog(@"タッチ");
}


- (IBAction) memo_post_btn_down:(id)sender{
    
     //ボタン押下＆入投稿
     if(![memo_inputField.text isEqualToString:@""]){
     output_lbl.text = memo_inputField.text;
     
     //入力文字を保存
     NSUserDefaults *ud = [NSUserDefaults standardUserDefaults]; 
     [ud setObject:memo_inputField.text forKey:@"IMPUT_TXT"];
     [ud synchronize];
     
     memo_inputField.text = @"";
     NSLog(@"投稿実施");
     }
     NSLog(@"投稿");
    [memo_inputField resignFirstResponder];
    [self memCheck]; //メモリ状況チェック
    
}


-(BOOL)textFieldShouldReturn:(UITextField*)textField{
    [memo_inputField resignFirstResponder];
    return YES;
}


//メモ投稿用画面遷移ボタン元2
-(void)post_btn_down2:(UIButton*)button
{
    DetailViewController2 *detailViewController2 = [[DetailViewController2 alloc] initWithNibName:@"DetailViewController2" bundle:nil];
    [self.navigationController pushViewController:detailViewController2 animated:YES];
    [detailViewController2 release];
}

@end
