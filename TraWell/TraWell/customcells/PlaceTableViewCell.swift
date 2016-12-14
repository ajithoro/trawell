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
    var flowLayout:UICollectionViewFlowLayout = CustomFlowLayout()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let nib:UINib = UINib(nibName: "PlaceCollectionViewCell", bundle: nil)
        self.collectionViewPlaces.register(nib, forCellWithReuseIdentifier: kCellCollectionView)
        self.collectionViewPlaces.showsHorizontalScrollIndicator = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

extension PlaceTableViewCell {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(dataSourceDelegate: D, forRow row: Int) {
        // flow layout setup
        self.flowLayout.scrollDirection = .horizontal
        self.flowLayout.minimumInteritemSpacing = kInsetOffset/2.0
        self.flowLayout.minimumLineSpacing = kInsetOffset/2.0
        self.flowLayout.itemSize = CGSize(width: self.frame.width - 2*kInsetOffset, height: self.frame.height - 10.0)
        self.collectionViewPlaces.collectionViewLayout = self.flowLayout
        
        // collectionview setup
        self.collectionViewPlaces.dataSource = dataSourceDelegate
        self.collectionViewPlaces.delegate = dataSourceDelegate
        self.collectionViewPlaces.tag = row
        self.collectionViewPlaces.isPagingEnabled = false
        self.collectionViewPlaces.reloadData()
    }
    
}
