//
//  Extension.swift
//  Round One
//
//  Created by Jack Wong on 2017/08/17.
//  Copyright © 2017年 None. All rights reserved.
//

import Foundation
import UIKit

protocol RoundOneLayoutDelegate {
    
    func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:NSIndexPath,
                        withWidth:CGFloat) -> CGFloat
    
    func collectionView(collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat
    
}
