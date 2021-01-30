//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    private var tipSelected = 0.1
    private var splitNumberSelected = 2
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = sender == zeroPctButton
        tenPctButton.isSelected = sender == tenPctButton
        twentyPctButton.isSelected = sender == twentyPctButton
        
        if zeroPctButton.isSelected {
            tipSelected = 0.0
        } else if tenPctButton.isSelected {
            tipSelected = 0.1
        } else if twentyPctButton.isSelected {
            tipSelected = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberSelected = Int(sender.value)
        splitNumberLabel.text = "\(splitNumberSelected)"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print("Tip: \(tipSelected)")
        print("Split Number: \(splitNumberSelected)")
    }
}

