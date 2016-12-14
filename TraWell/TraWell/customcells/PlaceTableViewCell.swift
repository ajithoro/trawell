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
        self.collectionViewPlaces.registerNib(nib, forCellWithReuseIdentifier: kCellCollectionView)
        self.collectionViewPlaces.showsHorizontalScrollIndicator = false
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}

extension PlaceTableViewCell {
    
    func setCollectionViewDataSourceDelegate(dataSource: UICollectionViewDataSource, delegate: UICollectionViewDelegate, forRow row: Int) {
        // flow layout setup
        self.flowLayout.scrollDirection = .Horizontal
        self.flowLayout.minimumInteritemSpacing = kInsetOffset/2.0
        self.flowLayout.minimumLineSpacing = kInsetOffset/2.0
        self.flowLayout.itemSize = CGSize(width: self.frame.width - 2*kInsetOffset, height: self.frame.height - 10.0)
        self.collectionViewPlaces.collectionViewLayout = self.flowLayout
        
        // collectionview setup
        self.collectionViewPlaces.dataSource = dataSource
        self.collectionViewPlaces.delegate = delegate
        self.collectionViewPlaces.tag = row
        self.collectionViewPlaces.pagingEnabled = false
        self.collectionViewPlaces.reloadData()
    }
    
}
