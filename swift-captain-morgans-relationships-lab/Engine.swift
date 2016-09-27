//
//  Engine.swift
//  
//
//  Created by Flatiron School on 7/18/16.
//
//

import Foundation
import CoreData

@objc(Engine)
class Engine: NSManagedObject {

    enum EngineType: String {
        case sail = "Sail"
        case gas = "Gas"
        case electric = "Electric"
        case solar = "Solar"
        case oars = "Oars"
    }
    
    class func randomEngineType() -> String
    {
        let randomInt = Int(arc4random_uniform(4))
        
        switch (randomInt)
        {
        case 0:
            return EngineType.sail.rawValue
        case 1:
            return EngineType.gas.rawValue
        case 2:
            return EngineType.electric.rawValue
        case 3:
            return EngineType.solar.rawValue
        default:
            return EngineType.oars.rawValue
        }
    }
    
}
