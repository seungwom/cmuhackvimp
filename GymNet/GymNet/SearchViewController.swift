//
//  ViewController.swift
//  searchBio
//
//  Created by Vincent Peng on 9/14/19.
//  Copyright © 2019 Vincent Peng. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet var search: UIView!
    @IBOutlet var titlename: UIView!
    @IBOutlet weak var table: UITableView!
    //@IBOutlet weak var collect: UICollectionViewCell!
    @IBOutlet weak var tableView: UITableView!
    
    var id: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: 300, y:  150, width: 100, height: 50))
        button.backgroundColor = .black
        button.setTitle("Select", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(button)
        
        let prevButton = UIButton(frame: CGRect(x: 20, y:  150, width: 100, height: 50))
        prevButton.backgroundColor = .black
        prevButton.setTitle("Profile", for: .normal)
        prevButton.addTarget(self, action: #selector(buttonAction2), for: .touchUpInside)
        
        self.view.addSubview(prevButton)
        // Do any additional setup after loading the view.
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
        performSegue(withIdentifier: "toNextPage", sender: nil)
    }
    
    @objc func buttonAction2(sender: UIButton!) {
        print("Button tapped")
        performSegue(withIdentifier: "profileSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "profileSegue" {
            let profile = segue.destination as! MyProfileViewController
            profile.id = self.id
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
}

