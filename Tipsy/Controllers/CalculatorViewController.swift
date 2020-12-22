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
    @IBOutlet weak var splitStepper: UIStepper!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        guard let billValue = billTextField.text else {
            return
        }
        
        guard let bill = Double(billValue) else {
            return
        }
        
        var percentage = 0.0
        var percentageLabel = "0%"
        if tenPctButton.isSelected {
            percentage = 0.1
            percentageLabel = "10%"
        } else if twentyPctButton.isSelected {
            percentage = 0.2
            percentageLabel = "20%"
        }
        
        let split = splitStepper.value
     
        let calculation = (bill + (bill * percentage)) / split
        print(calculation)
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let resultsVC = mainStoryboard.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        resultsVC.calculation = calculation
        resultsVC.split = split
        resultsVC.percentage = percentageLabel
        present(resultsVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

