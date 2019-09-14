//
//  MyProfileViewController.swift
//  GymNet
//
//  Created by Kristina Kim on 9/14/19.
//  Copyright © 2019 Iris Lu. All rights reserved.
//

import UIKit
import Firebase

class MyProfileViewController: UIViewController {

    var id: String?
    var ref: DatabaseReference!
    
    @IBOutlet weak var goalPicker: UIPickerView!
    @IBOutlet weak var descrText: UITextView!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileView: UIImageView!
    
    @IBAction func nextButton(_ sender: Any) {
        performSegue(withIdentifier: "backtoSearchSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    /*
    func getData() {
        
        ref.child("users").child(id!).observeSingleEvent(of: .value) { (snapshot) in
            let key = snapshot.key
            if key == "Age" {
                self.ageLabel.text = snapshot.value as! String
            }
        }
        
        
        
        
        ref.child("users").child(id!).child("Age").observeSingleEvent(of: .value) { (snapshot) in
            let age = snapshot.value as? String
            print("age:", age)
            self.ageLabel.text = age
        }
        ref.child("users").child(id!).child("City").observeSingleEvent(of: .value) { (snapshot) in
            let city = snapshot.value as? String
            self.cityLabel.text = city
        }
        ref.child("users").child(id!).child("Goal").observeSingleEvent(of: .value) { (snapshot) in
            let goal = snapshot.value as? (String, Int)
            self.goalPicker.selectedRow(inComponent: goal!.1)
        }
        ref.child("users").child(id!).child("Name").observeSingleEvent(of: .value) { (snapshot) in
            let name = snapshot.value as? String
            self.nameLabel.text = name
        }
        ref.child("users").child(id!).child("Sex").observeSingleEvent(of: .value) { (snapshot) in
            let sex = snapshot.value as? String
            self.sexLabel.text = sex
        }
        ref.child("users").child(id!).child("Description").observeSingleEvent(of: .value) { (snapshot) in
            let text = snapshot.value as? String
            self.descrText.text = text
        }
        ref.child("users").child(id!).child("Photo").observeSingleEvent(of: .value) { (snapshot) in
            let image = snapshot.value as? UIImage
            self.profileView.image = image
        }



    }*/


}
