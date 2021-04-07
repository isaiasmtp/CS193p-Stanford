//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Isaias Martins on 05/03/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
            VStack{
            Grid(viewModel.cards){ card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear(duration: 0.5)){
                        viewModel.choose(card: card)
                    }
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(Color.orange)
            Button( action: {
                    withAnimation(.easeInOut){
                        viewModel.resetGame()
                    }
                },
                label: { Text("New Game") }
            )
        }
    }
}


struct CardView : View {
    var card : MemoryGame<String>.Card
    
    var body : some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRemaing: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaing = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)){
            animatedBonusRemaing = 0
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View{
        if card.isFaceUp || !card.isMatched {
            ZStack{
                Group{
                    if card.isConsumingBonusTime{
                        Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-animatedBonusRemaing*360-90), clockwise: true)
                            .onAppear{
                                startBonusTimeAnimation()
                            }
                    } else {
                        Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(-card.bonusRemaining*360-90), clockwise: true)
                    }
                }
                .padding(5).opacity(0.4)
                .transition(.identity)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360: 0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(.scale)
        }
    }
    
    //MARK: - Drawing Constants
     
    private func fontSize(for size: CGSize) -> CGFloat{ min(size.width, size.height) * 0.7 }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game =  EmojiMemoryGame()
        game.choose(card: game.cards[0])
        game.choose(card: game.cards[2])
        return EmojiMemoryGameView(viewModel: game)
    }
}
