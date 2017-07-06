//
//  CollectionViewCell.swift
//  Carousel Effect
//
//  Created by chenshukun on 17/7/6.
//  Copyright © 2017年 chenshukun. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var name = UILabel()
    var img = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func initSubViews() {
        
        name.frame = CGRect(x: 0, y: 20, width: self.frame.size.width, height: 21);
        name.font = UIFont.systemFont(ofSize: 30)
//        name.backgroundColor = UIColor.white
        name.textColor = UIColor.white
        name.textAlignment = .center
        self.addSubview(name)
        
        
        img = UIImageView(frame: CGRect(x: 10, y: 20, width: self.frame.size.width-20, height: self.frame.size.height - 40))
        self.addSubview(img)
        
    }
}
