//
//  ViewController.swift
//  Concentration
//
//  Created by Osher Yeffet on 13/04/2022.
//

import UIKit

class ViewController: UIViewController {

    var flipCount = 0{
        didSet{
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
        
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["😊","🥳","😊","🥳"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    func flipCard(withEmoji emoji: String, on button: UIButton){
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9479777217, green: 0.7767807245, blue: 0.900493443, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9479777217, green: 0.7767807245, blue: 0.900493443, alpha: 1)
        }
    }
    
}

