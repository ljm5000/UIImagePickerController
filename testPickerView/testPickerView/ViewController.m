//
//  ViewController.m
//  testPickerView
//
//  Created by admin on 15/10/19.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UIActionSheetDelegate>{



}

@property(nonatomic,strong) UIActionSheet *menuAction;

@property(nonatomic,strong) UIImagePickerController *imagePickerController;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - button action

- (IBAction)showActionSheet:(id)sender {
    
    [self.menuAction showInView:self.view];
}

#pragma mark - action sheet delegate

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{

    if (buttonIndex == 0) {

        //设置摄像头
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        
    }else{
        
        //设置相册
        
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
    
    }
    
    [self presentViewController:self.imagePickerController animated:YES completion:^{
        
    }];
    



}

#pragma mark -image picker view delegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{

 
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
        NSLog(@"%@",info);
        
        UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        [self.myImageView setImage:image];

    }];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{

    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];


}



#pragma mark - 懒加载方式

-(UIActionSheet *)menuAction{
    //该方法为创建menuAction,检测是否为空，空的时候创建

    if (!_menuAction) {
        
        _menuAction = [[UIActionSheet alloc] initWithTitle:@"选择" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍摄",@"照相", nil];
    }
    
    return _menuAction;
}

-(UIImagePickerController *)imagePickerController{

    if (!_imagePickerController) {
        
        _imagePickerController =[[UIImagePickerController alloc] init];
        
        _imagePickerController.delegate =self;
        
    }
    
    return _imagePickerController;


}



@end
