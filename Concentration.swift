//
//  Concentration.swift
//  Concentration
//
//  Created by Osher Yeffet on 14/04/2022.
//

import Foundation

struct Concentration{
    
    private(set) var cards = [Card]()

    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get{
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp{
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    var score = 0
    
    var flipCounter = 0
        
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in cards")
        if !cards[index].isMatched, cards[index].isValid {
            flipCounter += 1
            cards[index].seenNumber += 1
//            cards[matchIndex].seenNumber += 1
            if let matchIndex = indexOfTheOneAndOnlyFaceUpCard, matchIndex != index {
                //check if card match
                if cards[matchIndex] == cards[index] {
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
            }else{
                indexOfTheOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        assert(numberOfPairsOfCards > 0, "Concentration.init(at: \(numberOfPairsOfCards)): you must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card, card]
        }
        //TODO: Shuffle the cards - done
        cards.shuffle()
    }
}
