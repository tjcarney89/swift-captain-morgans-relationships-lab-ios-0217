//
//  CoreDataStack.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by TJ Carney on 3/17/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation
import CoreData

final class CoreDataStack {
    static let sharedInstance = CoreDataStack()
    private init () {}
    
    var pirates: [Pirate] = []
    var ships: [Ship] = []
    var engines: [Engine] = []
    let pirateNames = ["TJ", "Carlos", "Moe", "Will", "Bill", "Jeff", "Rob", "Pat", "Raquel", "Kaypree", "Ed", "Larry", "Amit", "Johann", "Jim", "Sejan", "Mike", "Sandro", "Ben", "Oliver" ]
    let shipNames = [Int](0...199)
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "PirateShips")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
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
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func generateTestData() {
        let context = persistentContainer.viewContext
        for i in 0...19 {
            let newPirate = Pirate(context: context)
            newPirate.name = pirateNames[i]
            for j in 0...9 {
                let newShip = Ship(context: context)
                newShip.name = String(shipNames[((j+1)*(i+1))-1])
                let newEngine = Engine(context: context)
                newEngine.engineType = EngineType.getRandomEngine()?.getStringValue()
                newShip.engine = newEngine
                newPirate.addToShips(newShip)
            }
        }
        saveContext()
        fetchData()
    }
    
    func fetchData() {
        let context = persistentContainer.viewContext
        let pirateFetchRequest: NSFetchRequest<Pirate> = Pirate.fetchRequest()
        let shipsFetchRequest: NSFetchRequest<Ship> = Ship.fetchRequest()
        let engineFetchRequest: NSFetchRequest<Engine> = Engine.fetchRequest()
        do {
            self.pirates = try context.fetch(pirateFetchRequest)
            self.ships = try context.fetch(shipsFetchRequest)
            self.engines = try context.fetch(engineFetchRequest)
        } catch {
        
        }
    }
    

    
}

enum EngineType: Int {
    case sail, gas, oars, nuclear
    
    static func getRandomEngine() -> EngineType? {
        let randomNumber = arc4random_uniform(UInt32(4))
        if let newEngineType = EngineType(rawValue: Int(randomNumber)) {
            return newEngineType
        } else {
            return nil
        }
    }
    
    func getStringValue() -> String {
        switch self.rawValue {
        case 0:
            return "sail"
        case 1:
            return "gas"
        case 2:
            return "oars"
        case 3:
            return "nuclear"
        default:
            return ""
        }
    }
}
