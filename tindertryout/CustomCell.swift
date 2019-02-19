//
//  CustomCell.swift
//  
//
//  Created by Nineleaps on 13/02/19.
//

//Class for Cutsom Cell Development

import UIKit
import Kingfisher

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var petImageView: UIImageView!
    
    @IBOutlet weak var petTitleLabel: UILabel!
    
    func setPet(name: String, image: String) {
        
        let url = URL(string: image)
        petImageView.kf.setImage(with: url)
        petTitleLabel.text = name
        
    }
}
