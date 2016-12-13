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
        self.collectionViewPlaces.dataSource = dataSourceDelegate
        self.collectionViewPlaces.delegate = dataSourceDelegate
        self.collectionViewPlaces.tag = row
        self.collectionViewPlaces.setContentOffset(self.collectionViewPlaces.contentOffset, animated: false)
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
