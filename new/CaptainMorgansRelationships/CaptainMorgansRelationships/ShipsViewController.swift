//
//  ShipsViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Ian Alexander Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class ShipsViewController: UITableViewController
{
    let CellIdentifier: String = "shipCell"
    var store: DataStore = DataStore.sharedInstance
    var pirate: Pirate!
    var ships: [Ship] = [] {
        didSet {
            print("Reloading data.")
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        ships = Array(pirate.ships)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pirate.ships.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        let currentShip = ships[(indexPath as NSIndexPath).row]
        cell.textLabel?.text = currentShip.name
        cell.detailTextLabel?.text = currentShip.engine.engineType
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "shipDetailSegue" {
            
            let nextVC = segue.destination as! ShipDetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            nextVC.ship = ships[(selectedIndexPath as NSIndexPath).row]
        } else {
            let nextVC = segue.destination as! AddShipViewController            
            nextVC.pirate = self.pirate
        }
    }
    
}
