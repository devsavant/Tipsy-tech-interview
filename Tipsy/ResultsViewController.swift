//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Rafael Peñates on 25/12/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var resultAmount = 0.0
    var totalPeople = 0
    var pct = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        totalLabel.text = "\(resultAmount)"
        settingsLabel.text = "Split between \(totalPeople), with \(pct*100)% tip. "
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
