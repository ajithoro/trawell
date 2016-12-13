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
    var favoritePlaces: [Place] = [Place]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableViewPlaces.delegate = self
        self.tableViewPlaces.dataSource = self
        self.tableViewPlaces.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: kCellDefault)
        self.tableViewPlaces.showsVerticalScrollIndicator = false
        
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
        
        self.favoritePlaces.append(andaman)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension FirstViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 44.0))
        view.backgroundColor = UIColor.white
        let label: UILabel = UILabel(frame: CGRect(origin: CGPoint(x: kInsetOffset, y: 0), size: view.frame.size))
        label.backgroundColor = UIColor.white
        label.text = (section == 0) ? "Just for the weekend" : "Airbnb Favorites"
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 2.0))
        view.backgroundColor = UIColor.lightGray
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellTableView, for: indexPath) as? PlaceTableViewCell
        cell?.backgroundColor = UIColor.clear
        return cell!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let placeTableViewCell = cell as? PlaceTableViewCell else {
            return
        }
        placeTableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.section)
    }
    
    /*
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let placeTableViewCell = cell as? PlaceTableViewCell else {
            return
        }
    }
    */
}

extension FirstViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0 {
            return self.places.count
        }
        return self.favoritePlaces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var places:[Place] = [Place]()
        if collectionView.tag == 0 {
            places = self.places
        } else {
            places = self.favoritePlaces
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellCollectionView, for: indexPath) as? PlaceCollectionViewCell
        if let image = UIImage(named: places[indexPath.row].imageName ?? "") {
            cell?.imageViewPlace.image = image
        } else if let image = UIImage(named: "placeholder") {
            cell?.imageViewPlace.image = image
        }
        cell?.labelPlace.text = places[indexPath.row].name ?? ""
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: kInsetOffset, bottom: 0, right: kInsetOffset)
    }

}


