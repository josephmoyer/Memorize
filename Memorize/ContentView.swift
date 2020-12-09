//
//  ContentView.swift
//  Memorize
//
//  Created by Joseph Moyer on 12/9/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            ForEach(0..<4){ index in
                CardView(isFaceUp: false)
            }
        }
                .foregroundColor(Color.orange)
                .padding()
                .font(Font.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View{
    @State var isFaceUp: Bool
    var body: some View {
        ZStack{
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                Text(String(Int.random(in: 0..<10)))
//                Text("👻")
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
        .onTapGesture(perform: {
            if isFaceUp {
                self.isFaceUp = false;
            }
            else {
                self.isFaceUp = true;
            }
        })
    }
}
