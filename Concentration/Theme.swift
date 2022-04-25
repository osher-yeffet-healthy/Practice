//
//  Theme.swift
//  Concentration
//
//  Created by Osher Yeffet on 17/04/2022.
//

import Foundation

struct Theme{
    static var emojis = ["Food": 0x1F35C...0x1F366,
                   "Vegetables": 0x1F345...0x1F34D,
                   "Celebration": 0x1F380...0x1F388,
                   "Clothing": 0x1F451...0x1F45B,
                   "Sport": 0x1F3BD...0x1F3C5,
                   "Animals": 0x1F400...0x1F409]
    
    static func chooseTheme() -> [String]{
        let index = Int(arc4random_uniform(UInt32(emojis.count)))
        var emojiArray = [String]()
        for emoj in Array(emojis.values)[index]{
            let c = String(UnicodeScalar(emoj)!)
            emojiArray.append(c)
        }
        return emojiArray
    }
}
