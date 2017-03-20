//
//  ShipDetailViewController.swift
//  swift-captain-morgans-relationships-lab
//
//  Created by TJ Carney on 3/17/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class ShipDetailViewController: UIViewController {
    
    @IBOutlet weak var shipLabel: UILabel!
    @IBOutlet weak var pirateLabel: UILabel!
    @IBOutlet weak var engineLabel: UILabel!
    
    
    var pirate: String!
    var ship: String!
    var engine: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        shipLabel.text = ship
        pirateLabel.text = pirate
        engineLabel.text = engine

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
