//
//  ViewController.swift
//  Spotlight Search
//
//  Created by chenshukun on 17/7/13.
//  Copyright © 2017年 chenshukun. All rights reserved.
//

import UIKit
import CoreSpotlight

//思路
/*
 1 导入框架 CoreSpotlight
 2 在程序中注册方法 eg: test()
 3 在 AppDelegate 中实现监听方法 ，根据标识拿到具体的哪个实例 进行aciton 动作区分
 4  
 
 */
class ViewController: UIViewController {

    var label = UILabel()
    var temp = ["A","a","chen","ios","chenshukun"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showTest()
        label.text = "hello world "
        
        test();
        
        
    }
    
    func showLabelText(a:Int) {
        var index = 0
        if  a > temp.count || a < 0  {
            index = 0
        }else {
            index = a;
        }
        
        let str = temp[index];
        label.text = "label 内容为 === " + str;
        
    }
    func showTest() {
        label.frame = CGRect(x: 40, y: 100, width: 300, height: 40);
        label.backgroundColor = UIColor.red
        self.view.addSubview(label);
    }
    

    
    func test() {
        
        var searchableItems = [CSSearchableItem]();
        let endCount = temp.count;
        
        for i in 0...endCount-1 {
            
         let attributeSet = CSSearchableItemAttributeSet(itemContentType: "chenshukun1")
            attributeSet.title = temp[i]
//            attributeSet.contentRating = 3;
            attributeSet.contentDescription = temp[i] + "hello worild " + "i春秋"
            attributeSet.keywords = ["ios","chenshukun"]
            
            let searchableItem = CSSearchableItem(uniqueIdentifier: "\(i+100)", domainIdentifier: "ChenShukun.Spotlight-Search", attributeSet: attributeSet);

            searchableItems.append(searchableItem);
            
            
        }
        
    
        CSSearchableIndex.default().indexSearchableItems(searchableItems) { (error: Error?) in
        
            print("+++++++++++++++");
            
        };
        
        /*
         NSArray *temp = @[@"宫崎骏-龙猫", @"宫崎骏-千与千寻", @"宫崎骏-天空之城"];
         6
         7             //创建SearchableItems的数组
         8             NSMutableArray *searchableItems = [[NSMutableArray alloc] initWithCapacity:temp.count];
         9
         10             for (int i = 0; i < temp.count; i ++) {
         11
         12                 //1.创建条目的属性集合
         13                 CSSearchableItemAttributeSet * attributeSet = [[CSSearchableItemAttributeSet alloc] initWithItemContentType:(NSString*) kUTTypeImage];
         14
         15                 //2.给属性集合添加属性
         16                 attributeSet.title = temp[i];
         17                 attributeSet.contentDescription = [NSString stringWithFormat:@"宫崎骏与%@", temp[i]];
         18                 attributeSet.thumbnailData = UIImagePNGRepresentation([UIImage imageNamed:[NSString stringWithFormat:@"%d.png", i+1]]);
         19
         20                 //3.属性集合与条目进行关联
         21                 CSSearchableItem *searchableItem = [[CSSearchableItem alloc] initWithUniqueIdentifier:[NSString stringWithFormat:@"%d", i+1] domainIdentifier:@"ZeluLi.SpotlightSearchDemo" attributeSet:attributeSet];
         22
         23                 //把该条目进行暂存
         24                 [searchableItems addObject:searchableItem];
         25             }
         26
         27             //4.吧条目数组与索引进行关联
         28             [[CSSearchableIndex defaultSearchableIndex] indexSearchableItems:searchableItems completionHandler:^(NSError * _Nullable error) {
         29                 if (!error) {
         30                     NSLog(@"%s, %@", __FUNCTION__, [error localizedDescription]);
         31                 }
         32             }];
         33         }
         */
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

