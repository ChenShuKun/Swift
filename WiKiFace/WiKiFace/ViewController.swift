//
//  ViewController.swift
//  WiKiFace
//
//  Created by chenshukun on 17/7/17.
//  Copyright © 2017年 chenshukun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button  = UIButton(type: .roundedRect);
        button.frame = CGRect(x: 100, y: 200, width: 100, height: 35)
        button.setTitle("push ", for: .normal);
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(butonActons), for: .touchUpInside)
        self.view.addSubview(button);
        
    }

    func butonActons(btn:UIButton) {
        
       print("button actions \(btn.currentTitle!)")

        let next = WikiFaceViewController()
        self.present(next, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

