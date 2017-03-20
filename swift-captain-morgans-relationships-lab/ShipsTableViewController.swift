//
//  ShipsTableViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by TJ Carney on 3/17/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class ShipsTableViewController: UITableViewController {
    
    let store = CoreDataStack.sharedInstance
    var ships: [Ship] = []
    var pirate: Pirate? 

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.fetchData()
        ships = pirate?.ships?.allObjects as! [Ship]
        tableView.reloadData()
    }
    // MARK: - Table view data source

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ships.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shipCell", for: indexPath)
        let currentShip = ships[indexPath.row]
        if let shipName = currentShip.name {
            cell.textLabel?.text = "SS Number \(shipName)"
        }
        
        cell.detailTextLabel?.text = currentShip.engine?.engineType
        // Configure the cell...

        return cell
    }
    

   
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "shipDetailSegue" {
            if let destVC = segue.destination as? ShipDetailViewController, let indexPath = tableView.indexPathForSelectedRow {
                let currentShip = ships[indexPath.row]
                if let pirate = currentShip.pirate?.name, let engine = currentShip.engine?.engineType, let ship = currentShip.name {
                    destVC.pirate = pirate
                    destVC.ship = ship
                    destVC.engine = engine
                    
                }
            }
        }
        if segue.identifier == "addShipSegue" {
            if let destVC = segue.destination as? AddShipViewController {
                 destVC.pirate = self.pirate 
            }
        }
    }
    

}
