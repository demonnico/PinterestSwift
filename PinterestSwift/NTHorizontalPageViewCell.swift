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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.textLabel?.font = UIFont.systemFont(ofSize: 13)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageView :UIImageView = self.imageView!;
        imageView.frame = CGRect.zero
        if (imageView.image != nil) {
            let imageHeight = imageView.image!.size.height*screenWidth/imageView.image!.size.width
            imageView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: imageHeight)
        }
    }
}

class NTHorizontalPageViewCell : UICollectionViewCell, UITableViewDelegate, UITableViewDataSource{
    var imageName : String?
    var pullAction : ((_ offset : CGPoint) -> Void)?
    var tappedAction : (() -> Void)?
    let tableView = UITableView(frame: screenBounds, style: UITableViewStyle.plain)
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.lightGray
        
        contentView.addSubview(tableView)
        tableView.register(NTTableViewCell.self, forCellReuseIdentifier: cellIdentify)
        tableView.delegate = self
        tableView.dataSource = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentify) as! NTTableViewCell!
        cell?.imageView?.image = nil
        cell?.textLabel?.text = nil
        if indexPath.row == 0 {
            let image = UIImage(named: imageName!)
            cell?.imageView?.image = image
        }else{
            cell?.textLabel?.text = "try pull to pop view controller 😃"
        }
        cell?.setNeedsLayout()
        return cell!
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        var cellHeight : CGFloat = navigationHeight
        if indexPath.row == 0{
            let image:UIImage! = UIImage(named: imageName!)
            let imageHeight = image.size.height*screenWidth/image.size.width
            cellHeight = imageHeight
        }
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tappedAction?()
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView : UIScrollView){
        if scrollView.contentOffset.y < navigationHeight{
            pullAction?(scrollView.contentOffset)
        }
    }
}
