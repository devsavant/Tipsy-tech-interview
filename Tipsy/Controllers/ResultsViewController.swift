//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Oscar_Pastas on 2/02/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    // Variables
    var tipSelectedValue = 0.10
    var numberGuests = 2
    var billTotalPlusTip = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        totalLabel.text = billTotalPlusTip
        settingsLabel.text = " - Split between \(numberGuests) people, with \(tipSelectedValue)% tip - "
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        // close - dismiss current/self view
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
