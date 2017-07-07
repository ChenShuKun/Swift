//
//  ViewController.swift
//  Get user's current location
//
//  Created by chenshukun on 17/7/7.
//  Copyright © 2017年 chenshukun. All rights reserved.
//

import UIKit
import CoreLocation

let screenWidth = UIScreen.main.bounds.size.width;

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    var label = UILabel()
    var location = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        intiSubView()
        showLocal()
        
    }
    
    func intiSubView() {
        
        let button = UIButton(type:.roundedRect)
        button.frame = CGRect(x:30 ,y:64 ,width:200,height:40);
        button.setTitle("获取位置", for: .normal);
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside);
        self.view.addSubview(button)
    }
    
    func showLocal() {
        label.frame = CGRect(x: 20, y: 140, width:screenWidth-40 , height: 300);
        label.textColor = UIColor.white
        label.numberOfLines = 0;
        label.backgroundColor = UIColor.red
        self.view.addSubview(label);
    }
    
    func startLocation() {
        
        if !CLLocationManager.locationServicesEnabled() {
            
            print("改设备不支持 ")
            return;
        }
        
        location.requestWhenInUseAuthorization()
//        location.requestAlwaysAuthorization()
        location.desiredAccuracy = kCLLocationAccuracyBest
        location.distanceFilter = kCLLocationAccuracyKilometer
        location.delegate = self
        
        location.startUpdatingLocation()
        
    }
    
    func buttonAction() {
        print("buttonAction ")
        
        startLocation()
        label.text = "获取地理位置中...."
    }
    
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let  currentLoc = locations.last! as CLLocation
        
        location.stopUpdatingLocation()
        print("精度 = \(currentLoc.coordinate.latitude)  维度 = \(currentLoc.coordinate.longitude)")
        getCityName(currentLoc)
        
    }
    
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: Error!) {
        
        print(error)

    }
    
    
    func getCityName(_ loc:CLLocation) {
        
        let geo = CLGeocoder()
        
        geo.reverseGeocodeLocation(loc) { ( placeMark , error ) in
            
            if nil == error {
                
                let dict = placeMark?.first?.addressDictionary
                print(dict);
                print("国家 \(dict?["Country"]!)")
                print("城市 \(dict?["City"]!)")
                print("SubLocality \(dict?["SubLocality"]!)")
                print("State \(dict?["State"]!)")
                print("街道 \(dict?["Street"]!)")
                print("Name \(dict?["Name"]!)")
                print("FormattedAddressLines \(dict?["FormattedAddressLines"]!)")
                
                
                let address = dict?["FormattedAddressLines"] as? NSArray
                self.label.text = address?.firstObject as? String
                
//                self.label.text = dict?["Name"] as? String
                
//                let mark = array.firstObject as! CLPlacemark
//                
////                let mark : CLPlacemark = (placeMark?.first as! CLPlacemark)!
//                
//                let dict =  mark.addressDictionary as? Dictionary
                
                
                
                
                
                
            }
            
        
        }
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

