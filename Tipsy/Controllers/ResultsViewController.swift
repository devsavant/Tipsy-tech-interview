//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Rolando Amarillo on 22/12/20.
//  Copyright © 2020 Rolando Amarillo. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var calculation: Double!
    var split: Double!
    var percentage: String!
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        totalLabel.text = String(format: "%.2f", calculation)
        settingsLabel.text = "Split between " + String(format: "%.0f", split) + " people, with " + percentage + " tip."
    }
    
}
