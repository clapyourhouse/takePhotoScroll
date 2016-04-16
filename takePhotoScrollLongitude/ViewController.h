//
//  ViewController.h
//  takePhotoScrollLongitude
//
//  Created by KitamuraShogo on 2016/04/10.
//  Copyright © 2016年 ShogoKitamura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITableViewDataSource,UITableViewDelegate>
- (IBAction)cameraBtn:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *takePhotoImage;

@property (strong, nonatomic) IBOutlet UITableView *contentTableView;

@end

