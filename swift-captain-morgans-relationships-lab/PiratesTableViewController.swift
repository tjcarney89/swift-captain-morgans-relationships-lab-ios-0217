//
//  PiratesTableViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by TJ Carney on 3/17/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class PiratesTableViewController: UITableViewController {

    let store = CoreDataStack.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.fetchData()
        if store.pirates.isEmpty {
            store.generateTestData()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        store.fetchData()
        tableView.reloadData()
    }

    
    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return store.pirates.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pirateCell", for: indexPath)
        let currentPirate = store.pirates[indexPath.row]
        if let name = currentPirate.name {
            cell.textLabel?.text = "Captain \(name)"
        }
        
        if let numberOfShips = currentPirate.ships?.count {
            cell.detailTextLabel?.text = "\(numberOfShips)"
        }
        

        return cell
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "shipsSegue" {
            if let destVC = segue.destination as? ShipsTableViewController, let indexPath = tableView.indexPathForSelectedRow {
                let selectedPirate = store.pirates[indexPath.row]
                destVC.pirate = selectedPirate
                destVC.ships = selectedPirate.ships!.allObjects as! [Ship]
            }
        }
    }
    

}
