//
//  MediaItemDetailsView.swift
//  TraktTopTen
//
//  Created by Paul Williamson on 13/04/2015.
//  Copyright (c) 2015 Paul Williamson. All rights reserved.
//

import UIKit

class MediaItemsDetailsView : UIView {
    
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var synopsisBackgroundView: UIView!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet var titleLabels: Array<UILabel>!
    @IBOutlet var metaDataLabels: Array<UILabel>!
    
    override func awakeFromNib() {
        styleTaglineLabel()
        styleSynopsisLabel()
        styleSynopsisBackgroundView()
        styleMetaDataLabels()
        styleTitleLabels()
    }
    
    private func styleTaglineLabel() {
        taglineLabel.textColor = UIColor.applicationWhiteColour()
        taglineLabel.font = UIFont.mediaTaglineFont()
    }
    
    private func styleSynopsisLabel() {
        synopsisLabel.textColor = UIColor.applicationWhiteColour()
        synopsisLabel.font = UIFont.mediaSynopsisFont()
    }
    
    private func styleSynopsisBackgroundView() {
        synopsisBackgroundView.backgroundColor = UIColor.clearColor()
    }
    
    private func styleMetaDataLabels() {
        for label in metaDataLabels {
            label.font = UIFont.mediaMetaDataFont()
            label.textColor = UIColor.applicationWhiteColour()
        }
    }
    
    private func styleTitleLabels() {
        for label in titleLabels {
            label.font = UIFont.mediaMetaDataFont()
            label.textAlignment = .Right
            label.alpha = 0.5;
            label.textColor = UIColor.applicationWhiteColour()
        }
    }
}
