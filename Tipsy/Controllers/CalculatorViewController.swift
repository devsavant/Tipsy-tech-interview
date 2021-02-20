//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

enum SelectedButtonTag: Int {
    case First
    case Second
    case Third
}
class CalculatorViewController: UIViewController {

    @IBOutlet weak var mBillTextField: UITextField!
    @IBOutlet weak var mZeroPctButton: UIButton!
    @IBOutlet weak var mTenPctButton: UIButton!
    @IBOutlet weak var mTwentyPctButton: UIButton!
    @IBOutlet weak var mSplitNumberLabel: UILabel!
    @IBOutlet weak var mStepper: UIStepper!
    
    var currentPercentage: Double = 0.1
    var splitNumber: Double = 2
    var total: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initial configuration
        mStepper.minimumValue = 1
        mStepper.value = 2
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueResultViewController") {
            if let resultViewController = segue.destination as? ResultsViewController {
                let percentage = "\(Int(currentPercentage * 100))%"
                resultViewController.totalValue = String(format: "%.2f", total)
                resultViewController.splitValue = String(format: "%.0f", splitNumber)
                resultViewController.percentageValue = percentage
            }
        }
    }
    
    
    @IBAction func onTipChanged(_ sender: UIButton) {
        dismissKeyboard()
        resetButtons()
        
        switch sender.tag {
        case SelectedButtonTag.First.rawValue:
            mZeroPctButton.isSelected = true
            currentPercentage = 0.0
        case SelectedButtonTag.Second.rawValue:
            mTenPctButton.isSelected = true
            currentPercentage = 0.1
        case SelectedButtonTag.Third.rawValue:
            mTwentyPctButton.isSelected = true
            currentPercentage = 0.2
        default:
            resetButtons()
        }
    }
    
    @IBAction func onStepperValueChange(_ sender: UIStepper) {
        dismissKeyboard()

        splitNumber = sender.value
        mSplitNumberLabel.text = String(Int(splitNumber))
    }
    
    @IBAction func onCalculateValue(_ sender: Any) {
        dismissKeyboard()

        guard let bill = mBillTextField.text else {
            return
        }
        
        if (bill == "") {
            createAlertDialog(message: Constants.NO_BILL)
            return
        }

        if let totalBill = Double(bill) {
            print(currentPercentage, splitNumber, totalBill)
            let tipValue = totalBill * currentPercentage
            total = (totalBill + tipValue) / splitNumber
            onOpenToResultViewController()
        }
        
        createAlertDialog(message: Constants.WRONG_NUMBER)
        return
    }
    
    private func dismissKeyboard() {
        self.view.endEditing(true)
    }
 
    private func resetButtons() {
        mZeroPctButton.isSelected = false
        mTenPctButton.isSelected = false
        mTwentyPctButton.isSelected = false
    }
    
    private func onOpenToResultViewController() {
        performSegue(withIdentifier: "segueResultViewController", sender: self)
    }
}

// MARK: -  Alert Dialog
extension CalculatorViewController {
    func createAlertDialog(message: String) {
        let dialogMessage = UIAlertController(title: "Wait!", message: message , preferredStyle: .alert)
         
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
         
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
    }
}
