//
//  ViewController.swift
//  Animated Splash
//
//  Created by chenshukun on 17/7/11.
//  Copyright © 2017年 chenshukun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.red
        
        //设置layer的position
        orangeLayer.position = view.center
        
        //将layer添加到view的layer上。就类似自定义的view要添加到controller的view上才能显示一样
        view.layer.addSublayer(orangeLayer)
        
        //为layer添加动画
//        orangeLayer.add(createGroupAnimation(), forKey: nil)
        
        
        
        testButton()
        
    }
    
    func testButton() {
        let btn = UIButton(type: .custom);
        btn.setTitle("start", for: .normal);
        btn.backgroundColor = UIColor.cyan
        btn.frame = CGRect(x: 100, y: 100, width: 80, height: 35);
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(btn);
    }
    
    func buttonAction() {
        //仿照 twiter 的 启动画面
        orangeLayer.frame = orangeLayer.frame
        orangeLayer.position = view.center
        view.layer.addSublayer(orangeLayer)
        
        orangeLayer.add(maskAnimation(), forKey: nil);
//        self.perform(#selector(removeLayer), with: nil, afterDelay: 1.7)
        
    }
    
    
    
    
    
    lazy var orangeLayer : CALayer = {
        let orange = CALayer()
        orange.bounds = CGRect(x: 0, y: 0, width: 150, height: 150)
        orange.backgroundColor = UIColor.orange.cgColor
        return orange
    }()
    
    
    
    fileprivate func createGroupAnimation() -> (CAAnimationGroup){
        
        //        实例化一个组动画对象
        let groupAnimation = CAAnimationGroup()
        
        //        创建旋转的动画
        let basicRotation = CABasicAnimation(keyPath: "transform.rotation.z")
        basicRotation.toValue = Float.pi * 2
        
        
        //        创建缩放的动画
        let basicScale = CABasicAnimation(keyPath: "transform.scale")
        basicScale.toValue = 0.2
        
        
        //        创建按照路径移动的动画
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "position")
        let endAngle = Float.pi * 2
        let arcPath = UIBezierPath(arcCenter: view.center, radius: 150, startAngle: 0, endAngle: CGFloat(endAngle), clockwise: true)
        keyFrameAnimation.path = arcPath.cgPath
        keyFrameAnimation.calculationMode = kCAAnimationPaced
        keyFrameAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        
        
        let rotation = basicRotation as CAAnimation
        let scale = basicScale as CAAnimation
        let keyFrame = keyFrameAnimation as CAAnimation
        
        //        将旋转、缩放、移动的动画添加到组动画中
        groupAnimation.animations = [rotation,scale,keyFrame]
        //        组动画重复次数
        groupAnimation.repeatCount = MAXFLOAT
        //        组动画时长
        groupAnimation.duration = 2
        
        return groupAnimation
        
    }
    

    fileprivate func maskAnimation () -> (CAKeyframeAnimation){
        
        //        放大缩小视图，keypath使用bounds
        let maskAni = CAKeyframeAnimation(keyPath: "bounds")
        
        //        动画时间
        maskAni.duration = 1.25
        
        //        动画延迟0.5秒播放
        maskAni.beginTime = CACurrentMediaTime() + 0.5
        
        //        设置关键帧动画的数值
        let starRect = orangeLayer.frame
        let tempRect = CGRect(x: 0, y: 0, width: 100, height: 100)
        let finalRect = CGRect(x: 0, y: 0, width: 2000, height: 2000)
        
        maskAni.values = [starRect,tempRect,finalRect]
        
        
        //        设置关键帧动画的运动节奏
        maskAni.timingFunctions = [CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut),CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut),CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)]
        
        
        //        动画播放结束后是否移除动画
        maskAni.isRemovedOnCompletion = true
        
        //        动画填充模式：kCAFillModeForwards:当动画结束后，layer会一直保持着动画最后的状态
        maskAni.fillMode = kCAFillModeForwards
        
        return maskAni
        
    }
    
    
    func removeLayer() {
        orangeLayer.removeFromSuperlayer()
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

