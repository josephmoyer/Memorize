//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Joseph Moyer on 12/9/20.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        Grid(viewModel.cards){ card in
                CardView(card: card).onTapGesture(perform: {
                    viewModel.choose(card: card)})
                    .padding(cardPadding)
        }
                .foregroundColor(Color.orange)
                .padding()
        
                
    }
    let cardPadding: CGFloat = 5
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

struct CardView: View{
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack{
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(Color.white)
    //                    .frame(width:100, height: 150)
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(lineWidth: edgeLineWidth)
    //                    .frame(width:100, height: 150)
                        
                    Text(card.content)
                } else {
                    if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                    }
                }
            }
//            .aspectRatio(0.66, contentMode: .fit)
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * fontScaleFactor))
    //        .frame(minWidth: 10, idealWidth: 50, maxWidth: 100, minHeight: 15, idealHeight:75, maxHeight: 150)
            
        })
        
    }
    
//    MARK - Drawing Constants
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
}
