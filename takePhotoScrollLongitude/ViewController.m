//
//  ViewController.m
//  takePhotoScrollLongitude
//
//  Created by KitamuraShogo on 2016/04/10.
//  Copyright © 2016年 ShogoKitamura. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //delegateメソッドがないからエラー？
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cameraBtn:(id)sender {
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        UIImagePickerController *cameraPicker = [[UIImagePickerController alloc]init];
        cameraPicker.sourceType = sourceType;
        cameraPicker.delegate = self;
        [self presentViewController:cameraPicker animated:YES completion:nil];
    }
}
//　撮影が完了時した時に呼ばれる
- (void)imagePickerController: (UIImagePickerController *)imagePicker
didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *cameraImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    [_takePhotoImage setImage:cameraImage];
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
//    _label.text = @"Tap the [Save] to save a picture";
}

// 撮影がキャンセルされた時に呼ばれる
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)imagePicker {
    [imagePicker dismissViewControllerAnimated:YES completion:nil];
//    _label.text = @"Canceled";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger dataCount;
    
    // テーブルに表示するデータ件数を返す
    switch (section) {
        case 0:
            dataCount = 1;
//            dataCount = self.dataSourceiPhone.count;
            break;
        case 1:
            dataCount = 2;
//            dataCount = self.dataSourceAndroid.count;
            break;
        default:
            break;
    }
    return dataCount;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    // 再利用できるセルがあれば再利用する
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        // 再利用できない場合は新規で作成
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:CellIdentifier];
    }
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = @"うぇい";
            break;
        case 1:
            cell.textLabel.text = @"うぇーーい";
            break;
        default:
            break;
    }
    
    return cell;
}

@end
