//
//  CowListTableViewController.swift
//  AnimalTracker
//
//  Created by Askar on 03.05.2022.
//
//

import UIKit

class CowListTableViewController: UITableViewController {

    var cowList: [Cow] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cowList = Cow.generateCows()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cowList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "id: \(cowList[indexPath.row].id) lat: \(cowList[indexPath.row].lat) lon: \(cowList[indexPath.row].lon)"
        return cell
    }
}
