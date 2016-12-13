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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableViewPlaces.delegate = self
        self.tableViewPlaces.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension FirstViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellTableView, for: indexPath)
        /*
        cell.textLabel?.text = "abc"
        cell.backgroundColor = UIColor.red
        */
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Just for the weekend"
        }
        return nil
    }
}

extension FirstViewController: UITableViewDelegate {
    
}


