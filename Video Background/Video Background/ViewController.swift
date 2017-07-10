//
//  ViewController.swift
//  Video Background
//
//  Created by chenshukun on 17/7/10.
//  Copyright © 2017年 chenshukun. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

class ViewController: UIViewController {

    
    var player:AVPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor.orange;
        initPlayer()
        initSubViews()
        
    }

    
    func  initPlayer() {
        
        let path = Bundle.main.path(forResource: "demo.mp4", ofType: "");
        player = AVPlayer(url: URL(fileURLWithPath: path!));
        
        let playerLayer = AVPlayerLayer(player: player);
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        
        playerLayer.frame = self.view.bounds;
        self.view.layer.addSublayer(playerLayer);
        
        loopRunVideo()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loopRunVideo), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil);
        
    }
    
    func loopRunVideo() {
        player.seek(to: kCMTimeZero);
        player.play()
    }
    
    
    
    func initSubViews() {
        
        //login button
        let loginBtn = UIButton(type: .custom);
        loginBtn.frame = CGRect(x: 20, y: screenHeight-140, width: screenWidth-40, height: 40);
        loginBtn.backgroundColor = UIColor.green;
        loginBtn.setTitle("login", for: .normal);
        loginBtn.tag = 100;
        loginBtn.addTarget(self, action: #selector(butttonAction), for: .touchUpInside)
        self.view.addSubview(loginBtn);
        
    
        let signUp = UIButton(type: .custom);
        signUp.frame = CGRect(x: 20, y: screenHeight-80, width: screenWidth-40, height: 40);
        signUp.backgroundColor = UIColor.white;
        signUp.setTitleColor(UIColor.green, for: .normal);
        signUp.setTitle("login", for: .normal);
        signUp.tag = 200;
        signUp.addTarget(self, action: #selector(butttonAction), for: .touchUpInside)
        self.view.addSubview(signUp);
    
    }
    
    
    func butttonAction(btn:UIButton) {
        
        print("button tag = \(btn.tag)")
        
        if self.player.timeControlStatus == .paused {
            print("---------------play");
            self.player.play();
        }else if self.player.timeControlStatus == .playing {
            self.player.pause()
            
            print("---------------pause ");
        }
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

