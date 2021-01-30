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
    
    private var tipSelected = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = sender == zeroPctButton
        tenPctButton.isSelected = sender == tenPctButton
        twentyPctButton.isSelected = sender == twentyPctButton
        
        if sender == zeroPctButton {
            tipSelected = 0.0
        } else if sender == tenPctButton {
            tipSelected = 0.1
        } else if sender == twentyPctButton {
            tipSelected = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print("\(tipSelected)")
    }
}

