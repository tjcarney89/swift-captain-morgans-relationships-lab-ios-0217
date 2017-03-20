//
//  AddPirateViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by TJ Carney on 3/20/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class AddPirateViewController: UIViewController {
    
    @IBOutlet weak var addPirateTextField: UITextField!
    
    let store = CoreDataStack.sharedInstance
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        if !addPirateTextField.hasText {
            let myAlert = UIAlertController(title: "Text Field Empty", message: "Please Enter Text", preferredStyle: .alert)
            let myAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            myAlert.addAction(myAction)
            self.present(myAlert, animated: true)
        } else {
            let context = store.persistentContainer.viewContext
            let newPirate = Pirate(context: context)
            newPirate.name = addPirateTextField.text
            store.pirates.append(newPirate)
            store.saveContext()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        let myAlert = UIAlertController(title: "Unsaved Changes", message: "Are you sure? There are unsaved changes.", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
        myAlert.addAction(yesAction)
        myAlert.addAction(noAction)
        self.present(myAlert, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
