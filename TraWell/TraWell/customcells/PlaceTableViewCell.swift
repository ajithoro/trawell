//
//  PlaceTableViewCell.swift
//  TraWell
//
//  Created by Unholy Saint on 13/12/16.
//  Copyright © 2016 Ajit Horo. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionViewPlaces: UICollectionView!
    var flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension PlaceTableViewCell {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(dataSourceDelegate: D, forRow row: Int) {
        
        self.flowLayout.scrollDirection = .horizontal
        self.flowLayout.minimumInteritemSpacing = 10.0
        self.flowLayout.minimumLineSpacing = 10.0
        self.flowLayout.itemSize = CGSize(width: self.frame.width - 20.0, height: self.frame.height - 20.0)
        self.collectionViewPlaces.collectionViewLayout = self.flowLayout
        
        self.collectionViewPlaces.dataSource = dataSourceDelegate
        self.collectionViewPlaces.delegate = dataSourceDelegate
        self.collectionViewPlaces.tag = row
        self.collectionViewPlaces.isPagingEnabled = true
        self.collectionViewPlaces.setContentOffset(self.collectionViewPlaces.contentOffset, animated: true)
        self.collectionViewPlaces.reloadData()
    }
    
    var collectionViewOffset: CGFloat {
        set {
            self.collectionViewPlaces.contentOffset.x = newValue
        }
        get {
            return self.collectionViewPlaces.contentOffset.x
        }
    }
    
}
