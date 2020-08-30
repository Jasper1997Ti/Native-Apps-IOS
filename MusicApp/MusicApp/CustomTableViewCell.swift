//
//  CustomTableViewCell.swift
//  MusicApp
//
//  Created by jasper on 28/08/2020.
//  Copyright © 2020 jasper. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "customCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "CustomTableViewCell", bundle: nil)
    }
    
    public func configure(with title: String, imageName: String, subTitle: String){
        
        coverImageView.image = UIImage(named: imageName)
        titleLabel.text = title
        subtitleLabel.text = subTitle
    }

    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
