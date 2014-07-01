//
//  NTHorizontalPageViewCell.swift
//  PinterestSwift
//
//  Created by Nicholas Tau on 7/1/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

import Foundation
import UIKit

class NTHorizontalPageViewCell : UICollectionViewCell{
    var imageName : String = " "
    var imageViewContent : UIImageView = UIImageView()
    init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.lightGrayColor()
        contentView.addSubview(imageViewContent)
    }
    
    override func layoutSubviews() {
        let image = UIImage(named: imageName)
        let imageHeight = image.size.height*screenWidth/image.size.width
        imageViewContent.frame = CGRectMake(0, 0, screenWidth, imageHeight)
        imageViewContent.image = UIImage(named: imageName)
        super.layoutSubviews()
    }
}