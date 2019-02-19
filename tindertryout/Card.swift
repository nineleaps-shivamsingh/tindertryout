//
//  Card.swift
//  Example
//
//  Created by HideakiTouhara on 2018/05/17.
//  Copyright © 2018年 HideakiTouhara. All rights reserved.
//

// Class to develop Stack of Cards

import UIKit
import Kingfisher

class Card: UIView {
    
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealTitle: UILabel!
    @IBOutlet weak var descrip: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    func prepareUI(text: String, img: String, desc: String) {
        mealTitle.text = text
        let url = URL(string: img)
        mealImage.kf.setImage(with: url)
        descrip.text = desc
        
    }
}
