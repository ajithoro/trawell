//
//  FirstViewController.swift
//  TraWell
//
//  Created by Nitin Kumar on 08/12/16.
//  Copyright © 2016 Ajit Horo. All rights reserved.
//

import UIKit

class FirstViewController: BaseViewController {
    
    @IBOutlet weak var tableViewPlaces: UITableView!
//    var storedOffsets = [Int: CGFloat]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableViewPlaces.delegate = self
        self.tableViewPlaces.dataSource = self
        self.tableViewPlaces.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: kCellDefault)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: kCellTableView, for: indexPath) as? PlaceTableViewCell
            cell?.backgroundColor = UIColor.clear
            return cell!
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellDefault, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Just for the weekend"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let placeTableViewCell = cell as? PlaceTableViewCell else {
            return
        }
        placeTableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
//        placeTableViewCell.collectionViewOffset = self.storedOffsets[indexPath.row] ?? 0
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let placeTableViewCell = cell as? PlaceTableViewCell else {
            return
        }
//        self.storedOffsets[indexPath.row] = placeTableViewCell.collectionViewOffset
        
    }
}

extension FirstViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellCollectionView, for: indexPath)
        cell.backgroundColor = UIColor.green
        return cell
    }
    
}


