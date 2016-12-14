//
//  CustomFlowLayout.swift
//  TraWell
//
//  Created by Unholy Saint on 14/12/16.
//  Copyright © 2016 Ajit Horo. All rights reserved.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    
    var previousOffset:CGFloat = 0.0
    var currentPage:NSInteger = 0
    
    override init() {
        super.init()
     }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        // centering collection view cell after scrolling
        let itemsCount = self.collectionView?.dataSource?.collectionView(self.collectionView!, numberOfItemsInSection: 0)
        if ((self.previousOffset > (self.collectionView?.contentOffset.x)!) && (velocity.x < 0.0)) {
            self.currentPage = max(self.currentPage - 1, 0)
        } else if ((self.previousOffset < (self.collectionView?.contentOffset.x)!) && (velocity.x > 0.0)) {
            self.currentPage = min(self.currentPage + 1, itemsCount! - 1);
        }
        // Update offset by using item size + spacing
        let updatedOffset:CGFloat = (self.itemSize.width + self.minimumInteritemSpacing) * CGFloat(self.currentPage)
        self.previousOffset = updatedOffset;
        return CGPoint(x: updatedOffset, y: proposedContentOffset.y)
    }
    
}
