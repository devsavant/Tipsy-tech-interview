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
    private var billTotal = 0.0
    
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
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberSelected = Int(sender.value)
        splitNumberLabel.text = "\(splitNumberSelected)"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if let billTotal = Double(billTextField.text!) {
            self.billTotal = billTotal
            self.performSegue(withIdentifier: "resultsViewController", sender: self)
        } else {
            let alert = UIAlertController(title: "Wrong Total", message: "Not a valid number: \(billTextField.text!).", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: { _ in }))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ResultsViewController {
            let vc = segue.destination as! ResultsViewController
            vc.tipPercentage = self.tipSelected
            vc.numberOfPeople = self.splitNumberSelected
            vc.billTotal = self.billTotal
        }
    }
}

extension Double {
    func roundToPlaces(_ places:Int) -> Double {
        let multiplier = pow(10.0, Double(places))
        return (multiplier * self).rounded() / multiplier
    }
}
