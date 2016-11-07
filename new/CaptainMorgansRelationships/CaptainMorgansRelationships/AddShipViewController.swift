//
//  AddShipViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Ian Alexander Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class AddShipViewController: UIViewController {
    
    @IBOutlet weak var shipNameField: UITextField!
    @IBOutlet weak var engineTypeField: UITextField!
    
    var pirate: Pirate!
    let store = DataStore.sharedInstance
    
    @IBAction func saveButtonTapped(_ sender: AnyObject) {
        guard let ship = shipNameField.text , ship.characters.count > 0 else { print("Ship name too short"); return }
        guard let engine = engineTypeField.text , engine.characters.count > 0 else { print("Engine name too short."); return }
        
        create(ship, engine)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: Create new Ship for Pirate
extension AddShipViewController {
    
    fileprivate func create(_ ship: String, _ engine: String) {
        let context = store.persistentContainer.viewContext
        let newShip: Ship = NSEntityDescription.insertNewObject(forEntityName: "Ship", into: context) as! Ship
        
        newShip.name = ship
        newShip.engine = NSEntityDescription.insertNewObject(forEntityName: "Engine", into: context) as? Engine
        newShip.engine!.engineType = engine
        
        pirate.addToShip(newShip)
        
        store.saveContext()
    }
    
}
