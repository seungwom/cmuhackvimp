//
//  ViewController.swift
//  GymNet
//
//  Created by Kristina Kim on 9/13/19.
//  Copyright © 2019 Iris Lu. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var GymNetTitle: UILabel!
    
    @IBOutlet weak var LoginLabel: UIButton!
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.EmailText.delegate = self
        self.PasswordText.delegate = self
        
        isValidAccount()
        // Do any additional setup after loading the view.
    }
    
    func isValidAccount() {
        if EmailText.text == "" || PasswordText.text == "" {
            LoginLabel.isUserInteractionEnabled = false
        } else {
            LoginLabel.isUserInteractionEnabled = true
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //textField.resignFirstResponder()
        textField.endEditing(true)
        isValidAccount()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
        isValidAccount()
    }

    @IBAction func LoginButton(_ sender: Any) {
        let email = EmailText.text!
        let password = PasswordText.text!
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let u = user {
                print("sign in")
            } else {
                var error = UIAlertController(title: "Incorrect email or password", message: nil, preferredStyle: .alert)
                let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
                error.addAction(action)
                self.present(error, animated: true, completion: nil)
                self.EmailText.text = ""
                self.PasswordText.text = ""
            }
        }
        
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        performSegue(withIdentifier: "SignUpSegue", sender: nil)
    }
    
}

