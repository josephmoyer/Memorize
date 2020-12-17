//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Joseph Moyer on 12/10/20.
//

import Foundation

class EmojiMemoryGame: ObservableObject{
    @Published private var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String>{
        var emojis: Array<String> = ["👻","💀", "🎃", "🕷", "🕸", "🍏"]
        emojis.shuffle()
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2...emojis.count)) { pairIndex in
            emojis[pairIndex]
        }
    }
    

    
    var cards: Array<MemoryGame<String>.Card>{
        game.cards
    }
    
    // MARK: -   Intents
    
    func choose(card: MemoryGame<String>.Card){
        objectWillChange.send()
        game.choose(card: card)
        
    }
}
