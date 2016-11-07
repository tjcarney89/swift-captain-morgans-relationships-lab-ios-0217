//
//  DataStore.swift
//  CaptainMorgansRelationships
//
//  Created by Ian Rahman on 11/7/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import CoreData


class DataStore {
    
    static let sharedInstance = DataStore()
    var pirates: [Pirate] = []
    
    private init() {}
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "CaptainMorgansRelationships")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // MARK: - Core Data Fetch support
    
    func fetchData() {
        let context = persistentContainer.viewContext
        let pirateRequest = NSFetchRequest<Pirate>(entityName: "Pirate")
        
        do {
            pirates = try context.fetch(pirateRequest)
        }
            
        catch let error as NSError {
            NSLog("Unresolved error \(error), \(error.userInfo)")
            pirates = []
        }
        
        if pirates.count == 0 {
            generateTestData()
        }
    }
    
    // MARK: - Generation of test data
    
    func generateTestData() {
        let context = persistentContainer.viewContext
        var numberOfShips = [4, 3, 5]
        
        for pirateNumber in 0..<numberOfShips.count {
            let currentPirate = NSEntityDescription.insertNewObject(forEntityName: "Pirate", into: context) as! Pirate
            currentPirate.name = "AAARGH! Pirate #" + String(pirateNumber + 1)
            
            for shipNumber in 0..<numberOfShips[pirateNumber] {
                let currentShip = NSEntityDescription.insertNewObject(forEntityName: "Ship", into: context) as! Ship
                currentShip.name = "Awesome Ship #" + String(shipNumber + 1)
                currentShip.engine = NSEntityDescription.insertNewObject(forEntityName: "Engine", into: context) as? Engine
                currentShip.engine!.engineType = randomEngineType()
                currentPirate.addToShips(currentShip)
            }
        }
        
        saveContext()
        fetchData()
    }
    
    enum EngineType: String {
        case sail = "Sail"
        case gas = "Gas"
        case nuclear = "Nuclear"
        case solar = "Solar"
        case oars = "Oars"
    }
    
    func randomEngineType() -> String {
        let randomInt = Int(arc4random_uniform(4))
        
        switch (randomInt) {
        case 0:
            return EngineType.sail.rawValue
        case 1:
            return EngineType.gas.rawValue
        case 2:
            return EngineType.nuclear.rawValue
        case 3:
            return EngineType.solar.rawValue
        default:
            return EngineType.oars.rawValue
        }
    }
}
