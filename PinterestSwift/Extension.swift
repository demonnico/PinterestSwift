//
//  UIView+Utils.swift
//  PinterestSwift
//
//  Created by Nicholas Tau on 7/2/14.
//  Copyright (c) 2014 Nicholas Tau. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    func origin (point : CGPoint){
        frame.origin.x = point.x
        frame.origin.y = point.y
    }
}

var kIndexPathKey = "kAlwaysBouncePlaceholder"
let kIndexPathPointer: CConstVoidPointer = &kIndexPathKey
extension UICollectionView{
//    var currentIndexPath : NSIndexPath{
//    get{
//        return objc_getAssociatedObject(self,kIndexPathPointer) as NSIndexPath
//    }set{
//        objc_setAssociatedObject(self, kIndexPathPointer, newValue, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
//    }} WTF! error when building, it's a bug 
//    http://stackoverflow.com/questions/24021291/import-extension-file-in-swift
    
    func setCurrentIndexPath (indexPath : NSIndexPath){
        objc_setAssociatedObject(self, kIndexPathPointer, indexPath, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
    }
    
    func currentIndexPath () -> NSIndexPath {
        if let indexPath = objc_getAssociatedObject(self,kIndexPathPointer) as? NSIndexPath {
            return indexPath
        }
        let index = self.contentOffset.x/self.frame.size.width
        return NSIndexPath(forRow: Int(index), inSection: 0)
    }
}