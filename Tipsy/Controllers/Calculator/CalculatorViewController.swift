//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var numberOfPeopleStepper: UIStepper!
    
    let segueResultsId = "calculatorSegueResultsId"
    var selectedTip = 0
    var resultSplit : ResultSplit = ResultSplit()
    
    override func viewDidLoad() {
         self.hideKeyboardWhenTappedAround()
        setUpPercentageButtons()
    }
    
    fileprivate func setUpPercentageButtons() {
        //Dafault
        self.tenPctButton.isSelected = true
        selectedTip = 10
       
        self.zeroPctButton.isSelected = false
        self.twentyPctButton.isSelected = false
        
        //Tags
        self.zeroPctButton.tag = 0
        self.tenPctButton.tag = 10
        self.twentyPctButton.tag = 20
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        self.zeroPctButton.isSelected = false
        self.tenPctButton.isSelected = false
        self.twentyPctButton.isSelected = false
        switch sender.tag {
        case 0:
            self.zeroPctButton.isSelected = true
            selectedTip = 0
        case 10:
            self.tenPctButton.isSelected = true
            selectedTip = 10
        case 20:
            self.twentyPctButton.isSelected = true
            selectedTip = 20
        default: break
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        splitNumberLabel.text =  "\(Int(numberOfPeopleStepper.value))"
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        
        guard let billValue = Double(billTextField.text!), let numberOfPeople = Double(splitNumberLabel.text!) else {
            showBillValueAlert()
            return
        }
        
        var total = billValue
        switch selectedTip {
        case 10:
            total *= 1.10
        case 20:
            total *= 1.20
        default: break
        }
        
        self.resultSplit = ResultSplit(numberOfPeople: Int(numberOfPeople),
                                       value: round(total/numberOfPeople),
                                       percentage: selectedTip)
        performSegue(withIdentifier: segueResultsId, sender: nil)
    }
    
    func showBillValueAlert(){
        let alertcontroller = UIAlertController()
        alertcontroller.message = "Please add the bill value."
        
        let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default) { action in
            self.dismiss(animated: true, completion: nil)
        }
        
        alertcontroller.addAction(okAction)
        present(alertcontroller, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == segueResultsId){
            let resultsController = segue.destination as! CalculatorResultsViewController
            resultsController.resultSplit = resultSplit
        }
    }
}

