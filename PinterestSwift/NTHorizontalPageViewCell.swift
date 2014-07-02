//
//  NTHorizontalPageViewCell.swift
//  PinterestSwift
//
//  Created by Nicholas Tau on 7/1/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

import Foundation
import UIKit

let cellIdentify = "cellIdentify"

class NTTableViewCell : UITableViewCell{
    
    init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.textLabel.font = UIFont.systemFontOfSize(13)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRectZero
        if imageView.image {
            let imageHeight = imageView.image.size.height*screenWidth/imageView.image.size.width
            imageView.frame = CGRectMake(0, 0, screenWidth, imageHeight)
        }
    }
}

class NTHorizontalPageViewCell : UICollectionViewCell, UITableViewDelegate, UITableViewDataSource{
    var imageName : String = " "
    let tableView = UITableView(frame: screenBounds, style: UITableViewStyle.Plain)
    init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.lightGrayColor()
        
        
        contentView.addSubview(tableView)
        tableView.registerClass(NTTableViewCell.self, forCellReuseIdentifier: cellIdentify)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat{
        var cellHeight : CGFloat = 44
        if indexPath.row == 0{
            let image = UIImage(named: imageName)
            let imageHeight = image.size.height*screenWidth/image.size.width
            cellHeight = imageHeight
        }
        return cellHeight
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentify) as NTTableViewCell!
        cell.imageView.image = nil
        cell.textLabel.text = nil
        if indexPath.row == 0 {
            let image = UIImage(named: imageName)
            cell.imageView.image = image
        }else{
            cell.textLabel.text = "you'd custom this table view as you will"
        }
        cell.setNeedsLayout()
        return cell
    }
}