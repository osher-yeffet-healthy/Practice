//
//  ViewController.swift
//  Concentration
//
//  Created by Osher Yeffet on 13/04/2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2)
    
    //not good
//    var flipCount = 0 {
//        didSet{
//            flipCountLabel.text = "Flips: \(flipCount)"
//        }
//    }
    
    func startNewGame(){
        emojiChoices = ["😊","😇","😎","🤪","🥶","🤬","😴","🥰","🥸"]
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2 )
    }
    //New
    @IBOutlet weak var ScoreLabel: UILabel!
    
    //New
    @IBAction func NewGame(_ sender: UIButton) {
        startNewGame()
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
        
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            uptadeViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    func uptadeViewFromModel(){
        flipCountLabel.text = "Flips: \(game.flipCounter)"
        ScoreLabel.text = "Score: \(game.score)"
        for index in cardButtons.indices{
            let button =  cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.9479777217, green: 0.7767807245, blue: 0.900493443, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9479777217, green: 0.7767807245, blue: 0.900493443, alpha: 0) : #colorLiteral(red: 0.9479777217, green: 0.7767807245, blue: 0.900493443, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["😊","😇","😎","🤪","🥶","🤬","😴","🥰","🥸"]
    var emoji = [Int:String]()
    
    func emoji(for card: Card) -> String{
        if emoji[card.identifier] == nil, emojiChoices.count > 0{
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?" //return emoji[card.identifier], if its nil return "?"
    }
}

