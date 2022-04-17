//
//  Concentration.swift
//  Concentration
//
//  Created by Osher Yeffet on 14/04/2022.
//

import Foundation

class Concentration{
    
    var cards = [Card]()

    var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    var score = 0
    
    var flipCounter = 0
        
    func chooseCard(at index: Int){
        if !cards[index].isMatched, cards[index].isValid {
            flipCounter += 1
            cards[index].seenNumber += 1
//            cards[matchIndex].seenNumber += 1
            if let matchIndex = indexOfTheOneAndOnlyFaceUpCard, matchIndex != index {
                //check if card match
                if cards[matchIndex].identifier == cards[index].identifier {
                    score += 2
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    cards[index].isValid = false //check
                    cards[matchIndex].isValid = false //check
                }else{
                    if cards[index].seenNumber > 1 {
                        score -= 1
                    }
                    if cards[matchIndex].seenNumber > 1 {
                        score -= 1
                    }
                }
                cards[index].isFaceUp = true
                indexOfTheOneAndOnlyFaceUpCard = nil
            }else{
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfTheOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
        //TODO: Shuffle the cards - done
        cards.shuffle()
    }
}
