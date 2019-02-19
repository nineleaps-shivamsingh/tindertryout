//
//  ViewController.swift
//  tindertryout v2.8.1 ChcekBox Done + new Icons Addaed
//  Created by Nineleaps on 09/02/19.
//  Copyright © 2019 Nineleaps. All rights reserved.
//

import UIKit
import Alamofire
import SwiftKeychainWrapper
import AlamofireObjectMapper

//var token: String?
let obj = Apicalls()

class ViewController: UIViewController, UITextFieldDelegate {
    
    
   // swiftlint:disable identifier_name
    @IBOutlet weak var _username: UITextField!
    
    @IBOutlet weak var _password: UITextField!
    
    @IBOutlet weak var checkBox: UIButton!
    
    @IBOutlet weak var stack: UIStackView!
  
//    override func viewDidLoad() {
//    super.viewDidLoad()
////  textField.delegate = self
////  textField.tag = 0
//// Do any additional setup after loading the view, typically from a nib.
//    }
    
//Code to Shift the view up...Do not delete

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.stack.frame.origin.y == 0 {
                self.stack.frame.origin.y = (self.stack.frame.origin.y)  - (keyboardSize.height)
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.stack.frame.origin.y != 0 {
            self.stack.frame.origin.y = 0
        }
    }

    @IBAction func checkBoxtapped(_ sender: UIButton) {
        
        if sender.isSelected {
            
            sender.isSelected = false
           
        } else {
            
            sender.isSelected = true
     
        }
  
    }

    @IBAction func login(_ sender: Any) {
        
        let username = _username.text!
        let password = _password.text!


     if( username == "" || password == "" || !checkBox.isSelected) {
         Alert.showIncompleteFormAlert(on: self)
       } else {
        
        obj.loginapicall(username, password) { (response) -> (Void) in
      
        if response.response?.statusCode == 200
                {
                
                                let LoginResponse = response.result.value
                                let retrivedtoken = LoginResponse?.res?.text?.token!
                                let _: Bool = KeychainWrapper.standard.set(retrivedtoken!, forKey: "auth_token")
                                self.performSegue(withIdentifier: "homepage", sender: self)
                    
                }
                    
                else if response.response?.statusCode == 404
                {
                
                    Alert.wrongInput(on: self)
                }
        }
        
    }
}
    //Function to Shift the control to the next UItextfield on pressinng return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == _username{
            
            textField.resignFirstResponder()
           _password.becomeFirstResponder()
            
        } else if textField == _password {
            
            _password.becomeFirstResponder()
            
        }
        return true
    }

}
    

