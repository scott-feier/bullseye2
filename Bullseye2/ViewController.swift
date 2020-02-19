//
//  ViewController.swift
//  Bullseye2
//
//  Created by Scott Feier on 2/19/20.
//  Copyright © 2020 Scott Feier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Hello World", message: "My first app", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

