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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
