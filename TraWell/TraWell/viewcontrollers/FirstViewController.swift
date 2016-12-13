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
    var places:[Place] = [Place]()
//    var storedOffsets = [Int: CGFloat]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableViewPlaces.delegate = self
        self.tableViewPlaces.dataSource = self
        self.tableViewPlaces.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: kCellDefault)
        
        let bangalore:Place = Place(name: "Bangalore", imageName: "bangalore")
        let chennai:Place = Place(name: "Chennai", imageName: "chennai")
        let kolkata:Place = Place(name: "Kolkata", imageName: "kolkata")
        let delhi:Place = Place(name: "Delhi", imageName: "delhi")
        let leh:Place = Place(name: "Leh", imageName: "leh")
        let andaman:Place = Place(name: "Andaman", imageName: "andaman")
        
        self.places.append(bangalore)
        self.places.append(chennai)
        self.places.append(kolkata)
        self.places.append(delhi)
        self.places.append(leh)
        self.places.append(andaman)
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
        return self.places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellCollectionView, for: indexPath) as? PlaceCollectionViewCell
        cell?.backgroundColor = UIColor.green
        if let image = UIImage(named: self.places[indexPath.row].imageName ?? "") {
            cell?.imageViewPlace.image = image
        } else if let image = UIImage(named: "placeholder") {
            cell?.imageViewPlace.image = image
        }
        cell?.labelPlace.text = self.places[indexPath.row].name ?? ""
        return cell!
    }
    
}


