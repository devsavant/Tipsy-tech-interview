//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Miguel Mauricio Sierra on 29/01/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var numberOfPeople: Int = 0
    var tipPercentage: Double = 0.0
    var billTotal: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let totalPerPerson = billTotal * (1 + tipPercentage) / Double(numberOfPeople)

        totalLabel.text = "\(totalPerPerson.roundToPlaces(2))"
        settingsLabel.text = "Split between \(numberOfPeople) people,\nwith \(Int(tipPercentage*100))% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
