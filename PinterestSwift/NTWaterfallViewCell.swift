//
//  NTWaterfallViewCell.swift
//  PinterestSwift
//
//  Created by Nicholas Tau on 6/30/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

import UIKit

class NTWaterfallViewCell :UICollectionViewCell{
    var imageName : String = " "
    var imageViewContent : UIImageView = UIImageView()
    init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.lightGrayColor()
        contentView.addSubview(imageViewContent)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageViewContent.frame = CGRectMake(0, 0, frame.size.width, frame.size.height)
        imageViewContent.image = UIImage(named: imageName)
    }
}