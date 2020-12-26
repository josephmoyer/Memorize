//
//  MemoryGame.swift
//  Memorize
//
//  Created by Joseph Moyer on 12/10/20.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    var cards: Array<Card>
    var score: Int
    var lastChosenCardIndex: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set{
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    init (numberOfPairsOfCards:Int, cardContentFactory: (Int)->CardContent){
        cards = Array<Card>()
        
        for i in 0..<numberOfPairsOfCards{
            let content = cardContentFactory(i)
            cards.append(Card(id: i*2, content: content))
            cards.append(Card(id: i*2+1, content: content))
        } 
        cards.shuffle()
        
        score = 0
        
    }
    
    mutating func choose(card: Card){
        print("card chosen: \(card)")
        if card.isFaceUp{
            return
        }
        if card.isMatched{
            return
        }
        
        if let chosenIndex: Int = cards.firstIndex(matching: card),  !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = lastChosenCardIndex{
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                }else{
                    if cards[chosenIndex].isSeen{
                        score -= 1
                    }
                    if cards[potentialMatchIndex].isSeen{
                        score -= 1
                    }
                }
                cards[chosenIndex].isFaceUp = true
                cards[chosenIndex].isSeen = true
            } else {
                lastChosenCardIndex = chosenIndex
            }
            
        }

    }
    
    struct Card: Identifiable{
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var isSeen: Bool = false
    }
}


