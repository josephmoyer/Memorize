//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Joseph Moyer on 12/10/20.
//

import Foundation

class EmojiMemoryGame: ObservableObject{
    @Published private var game: MemoryGame<String>
    var currentTheme: Theme
    
    init() {
        let currentTheme = themes.randomElement()!
        self.currentTheme = currentTheme
        game = EmojiMemoryGame.createMemoryGame(with: currentTheme)
    }
    
    static func createMemoryGame(with theme: Theme) -> MemoryGame<String>{
        let emojis = theme.emojis.shuffled()
        let numberOfPairs = theme.count ?? Int.random(in: 2...emojis.count)
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairs) { pairIndex in
            emojis[pairIndex]
        }
        
    }
    
    
    func resetGame(){
        let theme: Theme = themes.randomElement()!
        self.currentTheme = theme
        game = EmojiMemoryGame.createMemoryGame(with: theme)
    }
    
    var cards: Array<MemoryGame<String>.Card>{
        game.cards
    }
    var score: Int{
        game.score
    }
    
    // MARK: -   Intents
    
    func choose(card: MemoryGame<String>.Card){
        objectWillChange.send()
        game.choose(card: card)
        
    }
    
    static let halloween = Theme(emojis: ["👻","💀", "🎃", "🕷", "🕸", "🍏","👽","☠️","🤖","🤡","👹","👺","😈","🥷","🧛","🧟","🧙‍♂️","🧞‍♂️","🧜‍♀️","🧚","🦇","🌕","🏴‍☠️"], name: "Halloween", color: .orange, count: 6) //halloween
    static let food = Theme(emojis: ["🍎","🥨","🍐","🍊","🍇","🍌","🍋","🍔","🍕","🥪","🌮","🍿"], name: "Food", color: .red, count: nil)
    static let christmas = Theme(emojis: ["🎅🏼","🧑🏻‍🎄","❄️","☃️","⛄️","🌨","🎄","🇨🇽","🎁","🕯","⛪️"], name: "Christmas", color: .green, count: nil)
    static let animals = Theme(emojis: ["🐻","🐼","🐨","🐻‍❄️","🐯","🦊","🦁","🐸","🙈","🙉","🙊","🐧","🦆","🐗","🦅","🦉","🐢","🐍","🦖","🦕","🦧","🦍","🐅","🦈","🐋","🐬","🦓","🐫","🐘","🦏","🦛","🦒","🦘","🐃","🦬","🦚","🦩","🦨","🐉"], name: "Wild Animals", color: .yellow, count: nil)
    static let sports = Theme(emojis: ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉","🎱","🏒","🏅","🏆"], name: "Sports", color: .blue, count: 6)
    static let flags = Theme(emojis: ["🏴‍☠️","🏳️‍🌈","🏳️‍⚧️","🚩","🏁","🇦🇫","🇦🇽","🇦🇱","🇩🇿","🇦🇸","🇦🇩","🇦🇴","🇦🇮","🇦🇶","🇦🇬","🇦🇷","🇦🇲","🇦🇼","🇦🇨","🇦🇺","🇦🇹","🇦🇿","🇧🇸","🇧🇭","🇧🇩","🇧🇧","🇧🇾","🇧🇪","🇧🇿","🇧🇯","🇧🇲","🇧🇹","🇧🇴","🇧🇦","🇧🇼","🇧🇻","🇧🇷","🇮🇴","🇻🇬","🇧🇳","🇧🇬","🇧🇫","🇧🇮","🇰🇭","🇨🇲","🇨🇦","🇮🇨","🇨🇻","🇧🇶","🇰🇾","🇨🇫","🇪🇦","🇹🇩","🇨🇱","🇨🇳","🇨🇽","🇨🇵","🇨🇨","🇨🇴","🇰🇲","🇨🇬","🇨🇩","🇨🇰","🇨🇷","🇨🇮","🇭🇷","🇨🇺","🇨🇼","🇨🇾","🇨🇿","🇩🇰","🇩🇬","🇩🇯","🇩🇲","🇩🇴","🇪🇨","🇪🇬","🇸🇻","🇬🇶","🇪🇷","🇪🇪","🇪🇹","🇪🇺","🇫🇰","🇫🇴","🇫🇯","🇫🇮","🇫🇷","🇬🇫","🇵🇫","🇹🇫","🇬🇦","🇬🇲","🇬🇪","🇩🇪","🇬🇭","🇬🇮","🇬🇷","🇬🇱","🇬🇩","🇬🇵","🇬🇺","🇬🇹","🇬🇬","🇬🇳","🇬🇼","🇬🇾","🇭🇹","🇭🇲","🇭🇳","🇭🇰","🇭🇺","🇮🇸","🇮🇳","🇮🇩","🇮🇷","🇮🇶","🇮🇪","🇮🇲","🇮🇱","🇮🇹","🇯🇲","🇯🇵","🇯🇪","🇯🇴","🇰🇿","🇰🇪","🇰🇮","🇽🇰","🇰🇼","🇰🇬","🇱🇦","🇱🇻","🇱🇧","🇱🇸","🇱🇷","🇱🇾","🇱🇮","🇱🇹","🇱🇺","🇲🇴","🇲🇰","🇲🇬","🇲🇼","🇲🇾","🇲🇻","🇲🇱","🇲🇹","🇲🇭","🇲🇶","🇲🇷","🇲🇺","🇾🇹","🇲🇽","🇫🇲","🇲🇩","🇲🇨","🇲🇳","🇲🇪","🇲🇸","🇲🇦","🇲🇿","🇲🇲","🇳🇦","🇳🇷","🇳🇵","🇳🇱","🇳🇨","🇳🇿","🇳🇮","🇳🇪","🇳🇬","🇳🇺","🇳🇫","🇲🇵","🇰🇵","🇳🇴","🇴🇲","🇵🇰","🇵🇼","🇵🇸","🇵🇦","🇵🇬","🇵🇾","🇵🇪","🇵🇭","🇵🇳","🇵🇱","🇵🇹","🇵🇷","🇶🇦","🇷🇪","🇷🇴","🇷🇺","🇷🇼","🇼🇸","🇸🇲","🇸🇹","🇸🇦","🇸🇳","🇷🇸","🇸🇨","🇸🇱","🇸🇬","🇸🇽","🇸🇰","🇸🇮","🇸🇧","🇸🇴","🇿🇦","🇬🇸","🇰🇷","🇸🇸","🇪🇸","🇱🇰","🇧🇱","🇸🇭","🇰🇳","🇱🇨","🇲🇫","🇵🇲","🇻🇨","🇸🇩","🇸🇷","🇸🇯","🇸🇿","🇸🇪","🇨🇭","🇸🇾","🇹🇼","🇹🇯","🇹🇿","🇹🇭","🇹🇱","🇹🇬","🇹🇰","🇹🇴","🇹🇹","🇹🇦","🇹🇳","🇹🇷","🇹🇲","🇹🇨","🇹🇻","🇺🇬","🇺🇦","🇦🇪","🇬🇧","🏴󠁧󠁢󠁥󠁮󠁧󠁿","🏴󠁧󠁢󠁳󠁣󠁴󠁿","🏴󠁧󠁢󠁷󠁬󠁳󠁿","🇺🇸","🇺🇾","🇺🇲","🇻🇮","🇺🇿","🇻🇺","🇻🇦","🇻🇪","🇻🇳","🇼🇫","🇪🇭","🇾🇪","🇿🇲","🇿🇼"], name: "Flags", color: .purple, count: 12)
            
    var themes = [halloween, food, christmas, animals, sports, flags]
}


