//
//  Alert.swift
//  tindertryoutz
//
//  Created by Nineleaps on 11/02/19.
//  Copyright © 2019 Nineleaps. All rights reserved.
//

//  Class to generat Alerts

import Foundation
import UIKit

struct Alert {
    
    private static func showBasicAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async { vc.present(alert, animated: true) }
    }
    static func showIncompleteFormAlert(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Incomplete Credentials", message: "Please fill all the fields")
    }
    static func wrongInput(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Inavlid Input", message: "Username/Password is Wrong")
    }
    static func logoutSuccesful(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Logout", message: "You have succesfully Logged Out")
    }
    static func endofStack(on vc: UIViewController) {
        showBasicAlert(on: vc, with: "Empty Stack", message: "The Stack has become Empty!")
    }

}
