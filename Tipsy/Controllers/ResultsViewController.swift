//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Juan Vargas on 20/02/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var mTotalLabel: UILabel!
    @IBOutlet weak var mSettingsLabel: UILabel!
    
    var totalValue: String = ""
    var splitValue: String = ""
    var percentageValue: String = ""
    
    override func viewDidLoad() {
        mTotalLabel.text = totalValue
        mSettingsLabel.text = "Split between \(splitValue) people, with \(percentageValue) tip."
    }
    
    @IBAction func onRecalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
