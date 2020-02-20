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
    var round: Int = -1
    var score: Int = 0
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startNewRound()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
    }
    
    func startNewRound() {
        //reset
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        updateLabels()
    }
    
    func calcScore() -> Int {
        var difference: Int = 0
        var score: Int = 0
        var bonus: Int = 0
        
        difference = abs(targetValue - currentValue)
        
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        }
        
        score = 100 - difference + bonus
        
        return score
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        roundLabel.text = String(round)
        scoreLabel.text = String(score)
        
    }
    
    
    @IBAction func showAlert() {
        
        var points: Int = 0
        let title: String
        
        points = calcScore()
        score = score + points
        
        if points == 100 {
            title = "Perfect"
        } else if points > 80 {
            title = "Pretty good"
        } else {
            title = "Okay"
        }
        
        
        let message = "Current Value \(currentValue)" +
            "\nTarget Value \(targetValue)" +
        "\nPoints \(points)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Dismiss", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = Int(slider.value.rounded())
    }
    
    @IBAction func startOver() {
        currentValue = 0
        targetValue = 0
        round = -1
        score = 0
        
        startNewRound()
    }
    
}

