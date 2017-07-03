//
//  ViewController.swift
//  Simple Stop Watch
//
//  Created by chenshukun on 17/7/3.
//  Copyright © 2017年 chenshukun. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.size.width;
let screenHeight = UIScreen.main.bounds.size.height;

class ViewController: UIViewController {
    
    var leftBtn = UIButton()
    var rightBtn = UIButton()
    var reSetBtn = UIButton()
    var label = UILabel()
    var timer : Timer?
    var second:Float = 0.0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        
        initLabel()
        reSetButton()
        initLeftAndRight()
        
    }
    
    
    
    func initLabel() {
        
        label.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 200);
        label.text = labeBecomeOrigin();
        label.textColor = UIColor.white
        label.textAlignment = .center;
        label.font = UIFont.systemFont(ofSize: 70);
        label.backgroundColor = UIColor.red
        self.view.addSubview(label)
        
    }
    
    //重置按钮
    func reSetButton() {
        
        reSetBtn.showsTouchWhenHighlighted = true;
        reSetBtn.frame = CGRect(x: screenWidth-80, y: 20, width: 60, height: 35);
        reSetBtn.setTitle("Reset", for: .normal);
        reSetBtn.setTitleColor(UIColor.white, for: .normal);
        reSetBtn.addTarget(self, action: #selector(resButtonAction), for: .touchUpInside)
        self.view.addSubview(reSetBtn);
        
        
        
    }
    
    func initLeftAndRight() {
        
        leftBtn.frame = CGRect(x: 0, y: 200, width: screenWidth, height: screenHeight-200)
        leftBtn.setTitle("开始", for: .normal);
        leftBtn.setTitle("暂停", for: .selected);
        leftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 50);
        leftBtn.addTarget(self, action: #selector(startORPauseAction(_:)), for: .touchUpInside)
        leftBtn.backgroundColor = UIColor.blue
        self.view.addSubview(leftBtn)
        
    }
    
    
    func startTimer() {
        
        if self.timer != nil {
            if self.timer!.isValid {
                self.timer?.invalidate()
            }
        }
        self.timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
    }
    
    func stopTimer() {
        if self.timer != nil {
            if self.timer!.isValid {
                self.timer?.invalidate()
            }
        }
    }
    
    //    #MARK:--- actions
    func timerAction() {
        second += 0.1;
        label.text = "\(second)";
    }
    
    
    func resButtonAction() {
        stopTimer()
        second = 0.0;
        label.text = labeBecomeOrigin();
        
        leftBtn.isSelected = false;
    }
    
    func startORPauseAction(_ button:UIButton) {
        button.isSelected = !button.isSelected;
        
        if button.isSelected {
            print("aaaaaa")
            startTimer()
        }else {
            print("=========")
            stopTimer()
        }
    }
    
    func labeBecomeOrigin() -> String {
        return "0.0";
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

