//
//  newBioViewController.swift
//  GymNet
//
//  Created by Kristina Kim on 9/14/19.
//  Copyright © 2019 Iris Lu. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth


class newBioViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var goalPicker: UIPickerView!
    @IBOutlet weak var descrText: UITextView!
    @IBOutlet weak var descrBottom: NSLayoutConstraint!
    @IBOutlet weak var profileView: UIImageView!
    @IBOutlet weak var photoButton: UIButton!
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var cityText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var sexOption: UISegmentedControl!
    
    
    
    var pickedImage = false
    var ref: DatabaseReference!
    var handle: DatabaseHandle!
    var id: String?
    var goal: String?
    var sex: String?
    
    let goals = ["Strength", "Cardio", "Lose weight", "Gain weight"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return goals.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        goal = goals[row]
        return goal
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        goalPicker.delegate = self
        goalPicker.dataSource = self
        descrText.layer.borderWidth = 1.0
        descrText.layer.borderColor = UIColor.gray.cgColor
        
        ref = Database.database().reference()
        
        sex = sexOption.titleForSegment(at: sexOption.selectedSegmentIndex)
        
        profileView.layer.borderWidth = 1.0
        profileView.layer.borderColor = UIColor.blue.cgColor
        // Do any additional setup after loading the view.
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //textField.resignFirstResponder()
        textField.endEditing(true)
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @IBAction func uploadPhotoButton(_ sender: Any) {
        let photoOption = UIAlertController(title: "Upload Photo", message: "Choose photo from library or take photo?", preferredStyle: .alert)
        let choosePhoto = UIAlertAction(title: "Choose photo", style: .default) { (UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePickerController = UIImagePickerController()
                imagePickerController.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
                imagePickerController.sourceType = .photoLibrary
                self.present(imagePickerController, animated: true, completion: nil)
                self.pickedImage = true
                self.photoButton.removeFromSuperview()
            }
        }
        let takePhoto = UIAlertAction(title: "Take Photo", style: .default) { (UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePickerController = UIImagePickerController()
                imagePickerController.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
                self.pickedImage = true
                self.photoButton.removeFromSuperview()
            }
        }
        photoOption.addAction(choosePhoto)
        photoOption.addAction(takePhoto)
        self.present(photoOption, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        profileView.image = image

        self.dismiss(animated: true, completion: nil)
    }
    
    func saveBio() {
        ref.child("users").child(self.id!).updateChildValues(["Name": nameText.text, "City": cityText.text, "Age": ageText.text, "Sex": self.sex, "Goal": goal, "Description": descrText.text, "Photo": profileView.image])
    }
    @IBAction func nextButton(_ sender: Any) {
        saveBio()
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
