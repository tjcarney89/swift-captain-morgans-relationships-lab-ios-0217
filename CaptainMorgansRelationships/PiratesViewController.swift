//
//  PiratesViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Ian Alexander Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class PiratesViewController: UITableViewController, NSFetchedResultsControllerDelegate
{
    let CellIdentifier  = "pirateCell"
    var store: DataStore = DataStore.sharedInstance
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        store.fetchData()
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return store.pirates.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        let pirates = Array(store.pirates)
        let currentPirate = pirates[indexPath.row]
        cell.textLabel?.text = currentPirate.name
        cell.detailTextLabel?.text = String(currentPirate.ships!.count)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "shipsSegue"
        {
            let nextVC = segue.destination as! ShipsViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            let selectedPirate = store.pirates[selectedIndexPath.row]
            nextVC.pirate = selectedPirate
        }
    }
    
}
