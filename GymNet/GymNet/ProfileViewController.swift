//
//  ViewController2.swift
//  searchBio
//
//  Created by Vincent Peng on 9/14/19.
//  Copyright © 2019 Vincent Peng. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var desc: UITableView!
    @IBOutlet weak var variable: UILabel!
    @IBOutlet weak var scrollTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIButton(frame: CGRect(x: 20, y:  150, width: 100, height: 50))
        backButton.backgroundColor = .black
        backButton.setTitle("Back", for: .normal)
        backButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(backButton)
        // Do any additional setup after loading the view.
    }
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
        performSegue(withIdentifier: "toPrevPage", sender: nil)
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
