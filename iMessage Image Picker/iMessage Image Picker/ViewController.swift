//
//  ViewController.swift
//  iMessage Image Picker
//
//  Created by chenshukun on 17/7/14.
//  Copyright © 2017年 chenshukun. All rights reserved.
//

import UIKit
import Photos



class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var headimg = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initSubView ()
        
        
    }

    func initSubView () {
        
        headimg.frame = CGRect(x: 40, y: 150, width: 300, height: 300);
        self.view.addSubview(headimg);
        
        
        let button = UIButton(type: .roundedRect);
        
        button.setTitle("选择相册", for: .normal);
        button.frame = CGRect(x: 40, y: 80, width: 300, height: 40);
        button.backgroundColor = UIColor.red
        button.setTitleColor(UIColor.white, for: .normal)
        button.tag  = 100;
        button.addTarget(self, action: #selector(buttonAction22), for: .touchUpInside);
        self.view.addSubview(button);
    
    }
    
    func buttonAction22 () {
       
        print(" 点击 action ");
    
        
    }
    
    
    func getAllPhoto() -> Array<Any> {
        
        var allPhotos = Array<Any>()
        
        /*
         - (NSMutableArray *)getAllPhoto{
         NSMutableArray *arr = [NSMutableArray array];
         // 所有智能相册
         PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
         for (NSInteger i = 0; i < smartAlbums.count; i++) {
         PHCollection *collection = smartAlbums[i];
         //遍历获取相册
         if ([collection isKindOfClass:[PHAssetCollection class]]) {
         PHAssetCollection *assetCollection = (PHAssetCollection *)collection;
         PHFetchResult *fetchResult = [PHAsset fetchAssetsInAssetCollection:assetCollection options:nil];
         PHAsset *asset = nil;
         if (fetchResult.count != 0) {
         for (NSInteger j = 0; j < fetchResult.count; j++) {
         //从相册中取出照片
         asset = fetchResult[j];
         PHImageRequestOptions *opt = [[PHImageRequestOptions alloc]init];
         opt.synchronous = YES;
         PHImageManager *imageManager = [[PHImageManager alloc] init];
         [imageManager requestImageForAsset:asset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeAspectFill options:opt resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
         if (result) {
         [arr addObject:result];
         }
         }];
         }
         }
         }
         }
         
         //返回所有照片
         return arr;
         }
         
         
         */
        
        
        
        return allPhotos;
    }
    
    
    //MARK :--- method 1
    func buttonAction(btn:UIButton) {
        
        let sheet = UIAlertController();
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("支持 ");
            sheet.title = "选择"
            sheet.message = "啥都能选择"
            let action =  UIAlertAction(title: "选择图片", style: .default, handler: { (alert:UIAlertAction) in
                print("图片")
                self .chooseActionWithType(type: 0)
            });
            
            let camera =  UIAlertAction(title: "选择相机", style: .destructive, handler: { (alert:UIAlertAction) in
                print("相机")
                self .chooseActionWithType(type: 1)
            });

            sheet.addAction(action);
            sheet.addAction(camera);
            
        }else {
            
            sheet.title = "选择图片"
            let action =  UIAlertAction(title: "选择图片", style: .default, handler: { (alert:UIAlertAction) in
                print("图片")
                self .chooseActionWithType(type: 0)
            });
            
            sheet.addAction(action);
            print(" 不 支持 -----------");
        }
        
        let cancel =  UIAlertAction(title: "取消", style: .cancel, handler: { (alert:UIAlertAction) in
            
            print("取消")
        });
        sheet.addAction(cancel);
        self.present(sheet, animated: true, completion: nil);
    }
    
    //type = 1 为 相机 ，type 为 0 为 相册
    func chooseActionWithType(type:Int) {
        
        var sourceType : UIImagePickerControllerSourceType = .photoLibrary;
        if type == 1 {
            sourceType = .camera
        }
        let imagPicker = UIImagePickerController()
        imagPicker.allowsEditing = true ;
        imagPicker.sourceType = sourceType;
        imagPicker.delegate = self
        self.present(imagPicker, animated: true, completion: nil);
        
    }
    
    //MARK:-- 代理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        picker.dismiss(animated: true) {
          
            print("diss miss ")
        };
        print(info);
        
        let chooseImg = info[UIImagePickerControllerEditedImage] as! UIImage
        headimg.image = chooseImg;
        
        
//        UIImageWriteToSavedPhotosAlbum(chooseImg, self, #selector(writePhoto), nil);
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        print("cancel");
        picker.dismiss(animated: true) {
            
            print(" diss miss ")
        };
        
    }
 
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

