//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Mohammad T. Jahed on 12/16/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalText: String = ""
    var settingsText: String = ""
    var parentVC: Closable? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = totalText
        settingsLabel.text = settingsText
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        parentVC?.OnClosed()
        self.dismiss(animated: true, completion: nil)
    }

    func Configure(bill: Double, percent: Double, quantity: Int, parentView: Closable) {
        parentVC = parentView
        
        var result = bill / Double(quantity)
        if (percent > 0.0) {
            result += result * percent
        }
        
        totalText = String(format: "%.2f", result)
        settingsText = "Split between \(String(quantity)) people, with \(String(percent * 100))% tip."
    }
}
