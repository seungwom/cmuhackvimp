//
//  ViewController.swift
//  Gym Net
//
//  Created by phoebe on 9/13/19.
//  Copyright © 2019 VIMP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameView: UITextField!
    @IBOutlet weak var ageView: UITextField!
    @IBOutlet weak var sexView: UITextField!
    @IBOutlet weak var cityView: UITextField!
    @IBOutlet weak var goalsView: UITextView!
    @IBOutlet weak var descView: UITextView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }

}

