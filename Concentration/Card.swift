//
//  Card.swift
//  Concentration
//
//  Created by Osher Yeffet on 14/04/2022.
//

import Foundation

struct Card{
    var isFaceUp = false
    var isMatched = false
    var isValid = true
    var seenNumber = 0
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
