//
//  AnimatedCardViewModel.swift
//  AnimationChallenge
//
//  Created by Pedro Larry Rodrigues Lopes on 02/04/25.
//

import Foundation
import SwiftUI

class AnimatedCardViewModel: ObservableObject {
    
    @Published var cards: [Card]
    
    var dealtCards: [Card] {
        cards.filter{$0.dealt}
    }
    
    var undealtCards: [Card] {
        cards.filter{!$0.dealt}
    }
    
    var discardedCards: [Card] {
        cards.filter{$0.discarded}
    }
    
    let animationDuration = 3.0
    
    init() {
        self.cards = AnimatedCardViewModel.createCards()
    }
    
    func chooseCard(_ card: Card) {
        // Eu nao poderia usar card.choose() justamente porque o que eu recebo como argumento da função é uma cópia da carta.
        // E mais do que isso, essa cópia por essência é um let, uma constante.
        
        let cardIndex = cards.findCardIndex(card)
        guard let cardIndex else {
            print("Carta não encontrada.")
            return
        }
       
        withAnimation(.snappy(duration: animationDuration)) {
            cards[cardIndex].choose()
//            cards[cardIndex].rotationAngle += 180
        }
    }
    
    func animateCards() {
        flipAllCards()
    }
    
    private func flipAllCards() {
        
        var animationDuration = 0.5
        
        withAnimation(Animation.linear(duration: animationDuration)) {
            for (index,_) in cards.enumerated(){
                cards[index].flip()
                
                animationDuration += 0.1
            }
        }
    }
    
    static func createCards() -> [Card] {
        let emojis = ["🐓", "🐔", "🐕", "🐈", "🐇"]
        var newCards = [Card]()
        
        for i in 0..<5 {
            let newCard = Card(id: i, emoji: emojis[Int.random(in: 0..<emojis.count)])
            newCards.append(newCard)
        }
        
        return newCards
    }
}

extension Array where Element == Card {
    func findCardIndex(_ searchedCard: Card) -> Int? {
        self.firstIndex { card in
            card.id == searchedCard.id
        }
    }
}
