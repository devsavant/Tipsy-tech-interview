//
//  Util.swift
//  Tipsy
//
//  Created by Oscar_Pastas on 3/02/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//
import Foundation
import UIKit

class Util {
    static func show(Message message: String, WithTitle title: String, InViewController viewController: UIViewController, success: (() -> Void)? , cancel: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) ->
                Void in success?()
            }))
        alertController.addAction(UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: { (action) ->
            Void in cancel?()
            }))
        viewController.present(alertController, animated: true, completion: nil)
    }
}
