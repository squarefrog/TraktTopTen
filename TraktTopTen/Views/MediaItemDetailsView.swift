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
        styleMetaDataLabels()
        styleTitleLabels()
        addBlur()
    }
    
    private func addBlur() {
        let blurEffect = UIBlurEffect(style: .Dark)
        let visualEffect = UIVisualEffectView(effect: blurEffect)
        visualEffect.frame = self.frame
        
        self.addSubview(visualEffect)
    }
    
    private func styleTaglineLabel() {
        
    }
    
    private func styleSynopsisLabel() {
        
    }
    
    private func styleSynopsisBackgroundView() {
        synopsisBackgroundView.backgroundColor = UIColor(white: 0.0, alpha: 0.1)
    }
    
    private func styleMetaDataLabels() {
        for label in titleLabels {
            label.textColor = UIColor.applicationWhiteColour()
            label.font = UIFont.mediaMetaDataFont()
        }
    }
    
    private func styleTitleLabels() {
        for label in titleLabels {
            label.textAlignment = .Right
            label.alpha = 0.5;
        }
    }
}
