//
//  Resultado ViewController.swift
//  Tipsy
//
//  Created by Maria Paula Gomez Prieto on 10/02/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    // MARK: - UI References
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var result: String = ""
    var porcentaje: String = ""
    var splitNumber: String = ""
    let resultText = "Split between %@ people, with %@ tip."
    
    // MARK: - UI Actions
    @IBAction func calculate(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        settingsLabel.text = String(format: resultText, splitNumber, porcentaje)
    }
}
