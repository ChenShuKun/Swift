//
//  WikiFaceViewController.swift
//  WiKiFace
//
//  Created by chenshukun on 17/7/17.
//  Copyright © 2017年 chenshukun. All rights reserved.
//

import UIKit

let screenWidth  = UIScreen.main.bounds.size.width
let screenHeight  = UIScreen.main.bounds.size.height

class WikiFaceViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var tableView = UITableView()
    var data  : NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor =  UIColor.cyan
        
        tableView.frame = CGRect(x: 0, y: 20, width: screenWidth, height: screenHeight)
        tableView.dataSource = self;
        tableView.delegate = self
        self.view.addSubview(tableView);
        
        data  = [
            "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=223138572,2764436179&fm=28&gp=0.jpg",

            "http://img4.imgtn.bdimg.com/it/u=4258410114,1864035878&fm=26&gp=0.jpg",
            "http://img3.imgtn.bdimg.com/it/u=3408403074,1974597991&fm=26&gp=0.jpg",
            "http://img4.imgtn.bdimg.com/it/u=407361219,2879624503&fm=26&gp=0.jpg",
            "http://img1.imgtn.bdimg.com/it/u=1432768490,212778581&fm=26&gp=0.jpg"];
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "CellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID);
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID);
        }
        
        cell?.textLabel?.text = self.data[indexPath.row] as? String
        
        return cell!
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let content:String = self.data[indexPath.row] as! String
        print("选中的内容为  = \(content)")
       
        
        let loadingVC = LoadImgViewController()
        loadingVC.imgURLL = content;
        let Nav = UINavigationController(rootViewController: loadingVC);
        self.present(Nav, animated: true, completion: nil)
        
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
