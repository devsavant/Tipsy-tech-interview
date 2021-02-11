//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    // MARK: - UI References
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    private var porcentaje: Double = 0.1
    private var splitNumber: Int = 0
    private var buttonSelected: UIButton?
    
    // MARK: - UI Actions
    @IBAction func tipChanged(_ sender: UIButton) {
        resetValue()
        
        switch sender.tag {
        case 1:
            porcentaje = 0.1
        case 2:
            porcentaje = 0.2
        default:
            porcentaje = 0
        }
        sender.isSelected = true
        self.view.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumber = Int(sender.value)
        splitNumberLabel.text = "\(splitNumber)"
        self.view.endEditing(true)
    }
    
    @IBAction func calculatePressed() {
        setCalculate()
    }

    // MARK: - Private methods
    private func setCalculate() {
        guard let billText = billTextField.text, let bill = Double(billText) else { return }
        
        let tip: Double = (bill * porcentaje)
        openResultViewController(result: "\(NSString(format: "%.2f", ((bill + tip)/Double(splitNumber))))")
    }
    
    private func resetValue() {
        zeroPcButton.isSelected = false
        tenPcButton.isSelected = false
        twentyPcButton.isSelected = false
    }
    
    private func openResultViewController(result: String) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let newViewController = storyBoard.instantiateViewController(withIdentifier: "result") as? ResultsViewController else { return }
        newViewController.result = result
        newViewController.porcentaje = "\(porcentaje * 100)%"
        newViewController.splitNumber = "\(splitNumber)"
        self.present(newViewController, animated: true, completion: nil)
    }
}
