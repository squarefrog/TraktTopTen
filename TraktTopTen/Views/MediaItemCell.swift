//
//  MediaItemCell.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 06/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import UIKit

class MediaItemCell: UICollectionViewCell {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        textLabel.font = UIFont.mediaCellLabelFont()
        textLabel.textColor = UIColor.applicationLightGrayColour()
    }
    
}
