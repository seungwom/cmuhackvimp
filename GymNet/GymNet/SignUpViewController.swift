//
//  SignUpViewController.swift
//  GymNet
//
//  Created by Kristina Kim on 9/14/19.
//  Copyright © 2019 Iris Lu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var SignUpLabel: UILabel!
    
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    @IBOutlet weak var ConfirmPasswordText: UITextField!
    @IBOutlet weak var SignUp: UIButton!
    
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.EmailText.delegate = self
        self.PasswordText.delegate = self
        self.ConfirmPasswordText.delegate = self

        isValidAccount()
        
        ref = Database.database().reference()
        
        // Do any additional setup after loading the view.
    }
    
    func isValidAccount() {
        if EmailText.text == "" || PasswordText.text == "" || ConfirmPasswordText.text == "" || PasswordText.text != ConfirmPasswordText.text {
            SignUp.isUserInteractionEnabled = false
        } else {
            SignUp.isUserInteractionEnabled = true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        isValidAccount()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        isValidAccount()
        self.view.endEditing(true)
    }
    
    
    @IBAction func BackButton(_ sender: Any) {
        performSegue(withIdentifier: "BackToLoginSegue", sender: nil)
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        
        let email = EmailText.text!
        let password = PasswordText.text!
        

        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if user != nil {
                self.ref.child("users").childByAutoId().setValue(["Email" : email, "Password" : password])
                self.handle = self.ref?.child("users").observe(.childAdded, with: { (snapshot) in
                    print(snapshot)
                })
                print("signed up")
                self.performSegue(withIdentifier: "newBioSegue", sender: nil)
            } else {
                print(error)
            }
        }
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
