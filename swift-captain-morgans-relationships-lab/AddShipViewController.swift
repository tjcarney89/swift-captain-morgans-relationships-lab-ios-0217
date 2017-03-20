//
//  AddShipViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by TJ Carney on 3/20/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class AddShipViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var shipTextField: UITextField!
    @IBOutlet weak var engineTextField: UITextField!
    
    let store = CoreDataStack.sharedInstance
    var pirate: Pirate?
    var engineOptions = ["gas", "sails", "oars", "nuclear"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let pickerView = UIPickerView()
        pickerView.delegate = self
        engineTextField.inputView = pickerView

        // Do any additional setup after loading the view.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return engineOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return engineOptions[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        engineTextField.text = engineOptions[row]
    }
    @IBAction func submitButtonTapped(_ sender: Any) {
        if !shipTextField.hasText || !engineTextField.hasText{
            let myAlert = UIAlertController(title: "All Fields Required", message: "Please Enter Text", preferredStyle: .alert)
            let myAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            myAlert.addAction(myAction)
            self.present(myAlert, animated: true)
        } else {
            let context = store.persistentContainer.viewContext
            let newShip = Ship(context: context)
            newShip.name = shipTextField.text
            newShip.engine = Engine(context: context)
            newShip.engine?.engineType = engineTextField.text
            pirate?.addToShips(newShip)
            store.saveContext()
            dismiss(animated: true, completion: nil)
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
