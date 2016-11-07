//
//  AddPirateViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by Ian Alexander Rahman on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class AddPirateViewController: UIViewController
{
    @IBOutlet weak var pirateNameField: UITextField!
    
    @IBAction func saveButtonTapped(_ sender: AnyObject)
    {
        if let text = pirateNameField.text , pirateNameField.text?.characters.count > 0
        {
            let dataStore = DataStore()
            let managedObjectContext = dataStore.managedObjectContext
            let newPirate = NSEntityDescription.insertNewObject(forEntityName: "Pirate", into: managedObjectContext) as! Pirate
            
            newPirate.name = text
            
            do
            {
                try managedObjectContext.save()
            } catch let error
            {
                print("Could not save Pirate: \(error)")
            }
            
            self.dismiss(animated: true, completion: nil)

        }
}
    
    @IBAction func cancelButtonTapped(_ sender: AnyObject)
    {
        self.dismiss(animated: true, completion: nil)
    }
}
