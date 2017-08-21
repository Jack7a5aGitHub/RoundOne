//
//  CollectionViewLayout.swift
//  Round One
//
//  Created by Jack Wong on 2017/08/17.
//  Copyright © 2017年 None. All rights reserved.
//

import UIKit

class CollectionViewLayout: UICollectionViewLayout {

    var delegate: RoundOneLayoutDelegate!
    
    var numberOfColumn = 1
    var cellPadding: CGFloat = 6.0
    
    private var cache = [UICollectionViewLayoutAttributes]()
    
    private var contentHeight: CGFloat = 0.0
    private var contentWidth: CGFloat {
        let insets = collectionView!.contentInset
        return collectionView!.bounds.width - (insets.left + insets.right)
    }
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    override func prepare(){
        if cache.isEmpty {
            
            let columnWidth = contentWidth / CGFloat(numberOfColumn)
            var xOffset = [CGFloat]()
            for column in 0 ..< numberOfColumn {
                xOffset.append(CGFloat(column) * columnWidth)
            }
            var column = 0
            var yOffset = [CGFloat](repeating:0, count: numberOfColumn)
            
            for item in 0 ..< collectionView!.numberOfItems(inSection: 0) {
                let indexPath = NSIndexPath(item: item, section: 0)
                let width = columnWidth - cellPadding * 2
                let photoHeight = delegate.collectionView(collectionView: collectionView!, heightForPhotoAtIndexPath: indexPath, withWidth: width)
                let annotationHeight = delegate.collectionView(collectionView: collectionView!, heightForAnnotationAtIndexPath: indexPath, withWidth: width)
                let height = cellPadding + photoHeight + annotationHeight + cellPadding
                let frame = CGRect(x: xOffset[column], y: yOffset[column], width: width, height: height)
                let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                
                let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath as IndexPath)
                attributes.frame = insetFrame
                cache.append(attributes)
                
                contentHeight = max(contentHeight, frame.maxY)
                yOffset[column] = yOffset[column] + height
                
                column = column >= (numberOfColumn - 1) ? 0 : column+1
                }
                
            }
        }
    // return frame with attribures in collectionView
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
    
    
    }

