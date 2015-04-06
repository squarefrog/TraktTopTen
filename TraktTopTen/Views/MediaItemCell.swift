//
//  MediaItemCell.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 06/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import UIKit
import Haneke

class MediaItemCell: UICollectionViewCell {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelBackgroundView: UIView!
    
    override func awakeFromNib() {
        textLabel.font = UIFont.mediaCellLabelFont()
        textLabel.textColor = UIColor.applicationLightGrayColour()
        labelBackgroundView.backgroundColor = UIColor.applicationTextBackgroundColour()
    }
    
    override func prepareForReuse() {
        imageView.hnk_cancelSetImage()
        imageView.image = nil
    }
    
}
