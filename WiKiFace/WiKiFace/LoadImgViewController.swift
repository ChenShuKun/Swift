//
//  LoadImgViewController.swift
//  WiKiFace
//
//  Created by chenshukun on 17/7/17.
//  Copyright © 2017年 chenshukun. All rights reserved.
//

import UIKit

class LoadImgViewController: UIViewController {

    var imgURLL = "";
    var imgView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.orange
        
        self.title = "加载图片"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(dissmissAction));
        
        
        imgView = UIImageView(frame: CGRect(x:(screenWidth-200)/2,y:200,width:200,height:200));
        imgView.backgroundColor = UIColor.red
        self.view.addSubview(imgView)
    
        
        
//        let url = URL(string: imgURLL)!
//        
//        let data = NSData(contentsOf: url)
//        if let dateImg = data {
//            
//            let imge = UIImage(data: dateImg as Data)
//            imgView.image = imge!
//        }
//        let url = URL(string: imgURLL)
//        let data = NSData(contentsOf: url!)!
//        imgView.image = UIImage(data: data as? Data );
        
        
        let url = URL(string: imgURLL)
        let request = URLRequest(url: url!)
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: request) { (data, responst, error) in
        
            if error == nil {
                
                DispatchQueue.main.async {
                    
                    let imge = UIImage(data: data!)
                    
                    if let datas =  imge {
                        self.imgView.image = datas
                    }else {
                        print("error ")
                    }
                    
                }
                
            }else {
                print(" error ");
            }
            
            
        };
        dataTask.resume()
    
        
    }
    
    func dissmissAction() {
        self.dismiss(animated: true) { 
            
        };
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
