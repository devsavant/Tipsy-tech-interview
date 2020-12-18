//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, Closable {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var quantityStepper: UIStepper!
    
    var percent: Double = 0
    var quantity: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        OnClosed()
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true

        if let text = sender.titleLabel?.text?.replacingOccurrences(of: "%", with: "") {
            print(text)
            percent = Double(text)! / 100
        }
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        quantity = Int(sender.value)
        billTextField.endEditing(true)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print(percent)
        print(quantity)
     
        if (billTextField.text!.isEmpty) {
            return
        }
        
        print(billTextField.text!)
        
        if Double(billTextField.text!) != nil {
            performSegue(withIdentifier: "showResultSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ResultsViewController {
            
            if let bill = Double(billTextField.text!) {
                let resultVC = segue.destination as! ResultsViewController
                resultVC.Configure(bill: bill, percent: percent, quantity: quantity, parentView: self)
            }
        }
    }
    
    func OnClosed() {
        zeroPctButton.isSelected = true
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        billTextField.text = "0.0"
        quantityStepper.value = 1
        stepperValueChanged(quantityStepper)
        
        billTextField.selectAll(self)
    }
}
