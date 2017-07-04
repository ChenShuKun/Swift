//
//  ViewController.swift
//  Custom Font
//
//  Created by chenshukun on 17/7/4.
//  Copyright © 2017年 chenshukun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label = UILabel()
    var fontLabel = UILabel()
    var familyArr :NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        familyArr = NSMutableArray()
        
        getAllFonts()
        initSubViews()
        
    }
    
    func initSubViews() {
        
        label.frame = CGRect(x: 20, y: 100, width: self.view.frame.size.width - 40, height: 300);
        label.textColor = UIColor.black
        label.text = testText()
        label.numberOfLines = 0;
        label.font = UIFont(name: "Helvetica Neue", size: 16);
        self.view.addSubview(label);
    
        let button = UIButton(type: .system);
        button.setTitle("change Font", for: .normal);
        button.backgroundColor = UIColor.red;
        button.frame = CGRect(x: 60, y: 30, width: 200, height: 40);
        button.addTarget(self, action: #selector(buttonAciton), for: .touchUpInside);
        self.view.addSubview(button);
        
        
        fontLabel.frame = CGRect(x: 20, y: 90, width: self.view.frame.size.width - 40, height: 21);
        fontLabel.textColor = UIColor.red
        self.view.addSubview(fontLabel);

        
    }
    func testText() -> String {
        return "1+2+3+4+5+6 *3-1 位数的随机整数,这个全局函数会生成10位数的随机整数,这个全局函数会生成10位数的随机整数（U这个全局函数会生成10位数的随机整数（U这个全局函数会生成10位数的随机整数（U"
    }
    //获取所有的字体
    func getAllFonts() {
        let familysArr =  UIFont .familyNames
        
        for items in familysArr {
            print(" 字体 name: \(items)");
            self.familyArr .add(items);
        }
    }
    
    func buttonAciton() {
        //类型不统一
        let  randoms =  Int(arc4random())%self.familyArr.count;
        let fontName = self.familyArr[randoms] as! String
        
        fontLabel.text = "显示的字体为: " + fontName;
        label.font = UIFont(name: fontName, size: 16);

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

