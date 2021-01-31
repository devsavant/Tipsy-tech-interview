//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Nestor Diazgranados on 1/30/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var resultSplit : ResultSplit!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = "\(resultSplit.value)"
        settingsLabel.text = "Split between \(resultSplit.numberOfPeople) people, with \(resultSplit.percentage)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
