//
//  ViewController.swift
//  PlayLocalVideo
//
//  Created by chenshukun on 17/7/5.
//  Copyright © 2017年 chenshukun. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var tableView:UITableView!
    var data:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        self.data = [["key":"demo.mp4","url":"demo.mp4"],
                     ["key":"AAAA.flv","url":"AAAA.flv"],
                     ["key":"demo.mp4","url":"demo.mp4"],
                     ["key":"AAAA.flv","url":"AAAA.flv"],
                     ["key":"demo.mp4","url":"demo.mp4"],
        ];
        initTableView()
        
    }
    
    func initTableView() {
        
        tableView = UITableView(frame: CGRect(x:0,y:0,width:screenWidth,height:screenHeight), style: .plain);
        tableView.dataSource = self;
        tableView.delegate = self;
        self.view.addSubview(tableView);
    }

    
    //MARK:---  TableView DataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "CellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID);
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID);
        }

        let model = self.data[indexPath.row] as! Dictionary<String, Any>
        cell?.textLabel?.text = model["key"] as? String;
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let model = self.data[indexPath.row] as! Dictionary<String, Any>
        let playUrl = model["url"] as! String
        print("play url = \(playUrl)")
        
        
        self.playVideoWithURL(urlStr: playUrl)
    }
    
    
    func playVideoWithURL(urlStr:String) {
        
        if urlStr.lengthOfBytes(using: .utf8) == 0 {
            print("url 为 nil");
            return;
        }
        
        let filePath = Bundle.main.path(forResource: urlStr, ofType: nil)
        let url : URL =  URL(fileURLWithPath: filePath!) ;
        NSLog("URL = \(url)")
        
        
        let player = AVPlayer(url: url)
        let avplayerVC = AVPlayerViewController()
        avplayerVC.player = player
        self.present(avplayerVC, animated: true) { 
            avplayerVC.player?.play();
        };
        
        
    }
    
    //Warning
    /*
     存在一个bug let filePath = Bundle.main.path(forResource: urlStr, ofType: nil)中 始终是 nil
      是因为在 添加到项目中的时候 没有点击 add target 中，导致获取不到到项目中的资源
     
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

