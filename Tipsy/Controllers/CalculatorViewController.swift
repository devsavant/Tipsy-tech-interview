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
    @IBOutlet weak var billTotalVerticalConstraint: NSLayoutConstraint!
    
    //Var and constant decl
    static var zeroPctButtonText = "zeroPctButton"
    static var tenPctButtonText = "tenPctButton"
    static var twentyPctButtonText = "twentyPctButton"
    static var resultsViewId = "showResultsView"
    static var defaultBillValue = "123.56"
    // Default tip value = 10%
    var tipValue = 0.10
    // Default currentNumberOfPersons
    var currentNumberOfPersons = 2
    var totalPlusTip = 0.0
    var stringBillTotal = "0.0"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupDefaultValues()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        animateBillLabel(150, 1)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        // dismiss keyboard when choose a tip option (press percentage button)
        billTextField.endEditing(true)
        // first test
        disableAllTipButton()
        sender.isSelected = true
        print("Tip Percentage: + \(String(describing: sender.currentTitle))")
        print("Tip Percentage: + \(String(describing: sender.currentTitle?.replacingOccurrences(of: "%", with: "")))")
        let value = sender.currentTitle!.replacingOccurrences(of: "%", with: "")
        // let number = Double(value) ?? 0 / 100
        tipValue = Double(value)! / 100
        print("Tip Percentage: + \(String(tipValue))")
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        currentNumberOfPersons = Int(sender.value)
        splitNumberLabel.text = String(currentNumberOfPersons)
        print("Number of guests: + \(String(currentNumberOfPersons))")
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let billText = billTextField.text!
        
        
        if (billText != "") {
            // Convert string to double
            calculateBillPlusTip(billText)
            self.performSegue(withIdentifier: CalculatorViewController.resultsViewId, sender: self)
        } else {
            Util.show(Message: "Alert", WithTitle: "Bill Total was not entered. Do you want to use default value:"
                + CalculatorViewController.defaultBillValue + "?", InViewController: self, success: { () -> Void in
                self.calculateBillPlusTip(CalculatorViewController.defaultBillValue)
                self.performSegue(withIdentifier: CalculatorViewController.resultsViewId, sender: self)
            }) { () -> Void in
                self.animateBillLabel(150, 1)
                print("User Cancelled operation")
            }
            return
        }
    }
    
    func calculateBillPlusTip(_ billText: String) {
        var billDouble = 0.0
        billDouble = Double(billText)!
        // Calculate formula ((1 + tip percentage) * bill)/ currentNumberOfPersons
        totalPlusTip = ((1 + tipValue) * billDouble) / Double(currentNumberOfPersons)
        print(String.init(format: "Final amount: %.2f", totalPlusTip))
        stringBillTotal = String.init(format: "%.2f", totalPlusTip)
    }

    // function added to hide keyboard when required
    @objc func dismissKeyboard() -> Void {
        view.endEditing(true)
    }
    
    func enableTipButton(_ option: String) {
        switch option {
        case CalculatorViewController.zeroPctButtonText:
            self.zeroPctButton.isSelected = true
        case CalculatorViewController.tenPctButtonText:
            self.tenPctButton.isSelected = true
        case CalculatorViewController.twentyPctButtonText:
            self.twentyPctButton.isSelected = true
        default:
            disableAllTipButton()
        }
    }
    
    func disableAllTipButton() {
        self.tenPctButton.isSelected = false
        self.zeroPctButton.isSelected = false
        self.twentyPctButton.isSelected = false
    }
    
    func setupDefaultValues() {
        //self.dismissKeyboard()
        tipValue = 0.10
        // default values for tip percentage
        disableAllTipButton()
        enableTipButton(CalculatorViewController.tenPctButtonText)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == CalculatorViewController.resultsViewId) {
            animateBillLabel(-150, 0)
            let goToViewController = segue.destination as! ResultsViewController
            goToViewController.tipSelectedValue = tipValue*100
            goToViewController.numberGuests = currentNumberOfPersons
            goToViewController.billTotalPlusTip = stringBillTotal
            
        }
    }
    
    func animateBillLabel(_ constantValue: CGFloat, _ alphaValue: CGFloat) {
        UIView.animate(withDuration: 1, animations: {
            self.billTotalVerticalConstraint.constant = constantValue
            self.view.layoutIfNeeded()
        }, completion: { (finished) in
            self.billTextField.alpha = alphaValue
            //Navigation parameters
        })
    }
    
}

