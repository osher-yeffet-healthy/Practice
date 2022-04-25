//
//  ViewController.swift
//  Concentration
//
//  Created by Osher Yeffet on 13/04/2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int{
        (cardButtons.count + 1)/2
    }
    
    private func startNewGame(){
        emojiChoices = Theme.chooseTheme()
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1)/2 )
        uptadeViewFromModel()
    }
    @IBOutlet private weak var ScoreLabel: UILabel!
    
    @IBAction private func NewGame(_ sender: UIButton) {
        startNewGame()
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
        
    @IBAction private func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            uptadeViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    private func uptadeViewFromModel(){
        flipCountLabel.text = "Flips: \(game.flipCounter)"
        ScoreLabel.text = "Score: \(game.score)"
        for index in cardButtons.indices{
            let button = cardButtons[index]
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
    
    private var emojiChoices = Theme.chooseTheme()
    
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String{
        if emoji[card] == nil, emojiChoices.count > 0{
            emoji[card] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emoji[card] ?? "?" //return emoji[card.identifier], if its nil return "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

