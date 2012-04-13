//
//  DetailViewController2.m
//  tt2
//
//  Created by taizo sato on 12/03/15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//


#import "DetailViewController.h"
#import "DetailViewController2.h"

@implementation DetailViewController2

- (void)dealloc
{
    [super dealloc];
}

//ナビゲーションバータイトル設定
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail2", @"Detail not View");
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    //■UIBarButtonボタン
    UIBarButtonItem *btn = [[[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                             target:self action:@selector(post_btn_down:)] autorelease];
    self.navigationItem.rightBarButtonItem = btn;
    
}

- (void)viewDidUnload
{

}

- (void)viewDidAppear:(BOOL)animated
{
    [tableview reloadData];
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

//UITableView 関連
- (NSInteger)numberOfSections {
    return 1; // セクションは2個とします
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch(section) {
        case 0: // 1個目のセクションの場合
            return @"セクションその1";
            break;
        /*    
        case 1: // 2個目のセクションの場合
            return @"セクションその2";
            break;
         */
    }
    return nil; //ビルド警告回避用
}

//セクションのセル数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *imputed_Text = [ud stringForKey:@"IMPUT_TXT"];
    //output_lbl.text = imputed_Text;
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    if(indexPath.section == 0) {
        if(indexPath.row == 0) {
            cell.textLabel.text = imputed_Text;
        } else if(indexPath.row == 1){
            cell.textLabel.text = @"セクション0 行1";
        } else {
            cell.textLabel.text = @"セクション0 行2";
        }
    } else {
        NSString *str = [[NSString alloc] initWithFormat:@"セクション%d 行%d",indexPath.section,indexPath.row];
        cell.textLabel.text = str;
        [str release];
    }
    return cell;
}

//セルタップ時のアクション
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; // 選択状態の解除をします。
    if(indexPath.section == 0) { // 1個目のセクションです。
        if(indexPath.row == 0) {
            myValue = -3;
        } else if(indexPath.row == 1) {
            myValue = -2;
        } else {
            myValue = -1;
        }
    } else { // 2個目のセクションです。
        myValue = indexPath.row; // 行の値をmyValueに代入しています。
    }
    NSLog(@"myValue:%d",myValue); // myValueの値をコンソールへ出力します。
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController_iPhone" bundle:nil];
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
}

//画面遷移ボタンto DetailViewController
-(IBAction)post_btn_down:(id)sender
{
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController_iPhone" bundle:nil];
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
}

@end
