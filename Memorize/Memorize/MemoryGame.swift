//
//  MemoryGame.swift
//  Memorize
//
//  Created by Isaias Pontes on 01/04/21.
//

import Foundation

struct MemoryGame<CardContent> {
    
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        let chosenIdenx : Int = cards.firstIndex(matching: card)
        self.cards[chosenIdenx].isFaceUp = !self.cards[chosenIdenx].isFaceUp
    }
    
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent){
        cards = Array<Card>()
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
