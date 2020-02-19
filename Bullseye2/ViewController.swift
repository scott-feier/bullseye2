//
//  ViewController.swift
//  Bullseye2
//
//  Created by Scott Feier on 2/19/20.
//  Copyright © 2020 Scott Feier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var roundValue: Int = 0
    var scoreValue: Int = 0
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewRound()

    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        roundLabel.text = String(roundValue)
        scoreLabel.text = String(scoreValue)
        
        roundValue = roundValue + 1
    }
    
    
    
    @IBAction func showAlert() {
        let message = "Current Value \(currentValue)" +
        "\nTarget Value \(targetValue)"
        
        let alert = UIAlertController(title: "Slider Value", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        startNewRound()
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = Int(slider.value.rounded())
    }

}

