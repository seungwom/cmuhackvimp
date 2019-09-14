//
//  ViewController.swift
//  search workout
//
//  Created by Vincent Peng on 9/14/19.
//  Copyright © 2019 Vincent Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var titlebar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let button = UIButton(frame: CGRect(x: 300, y:  150, width: 100, height: 50))
        button.backgroundColor = .black
        button.setTitle("Test Button", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        self.view.addSubview(button)
        // Do any additional setup after loading the view.
    }
    
    @objc func buttonAction(sender: UIButton!) {
        print("Button tapped")
        //performSegue(withIdentifier: "toNextPage", sender: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }



    
}

