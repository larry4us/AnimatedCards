//
//  Item.swift
//  AnimationChallenge
//
//  Created by Pedro Larry Rodrigues Lopes on 02/04/25.
//

import Foundation
import SwiftData

struct Card: Identifiable, CustomDebugStringConvertible, Equatable{
    var debugDescription: String {
        ("Carta \(emoji): id: \(id), dealt: \(dealt), discarded: \(discarded), rotation: \(rotationAngle)")
    }
    
    var id: Int
    var dealt: Bool = false
    var discarded: Bool = false
    var rotationAngle: Double = 0 
    
    let emoji: String
    
    mutating func flip() {
        dealt.toggle()
    }
    
    mutating func choose() {
        dealt.toggle()
    }
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        let equalRotation = lhs.rotationAngle == rhs.rotationAngle
        let equalDiscard = lhs.discarded == rhs.discarded
        let equalDealt = lhs.dealt == rhs.dealt
        let id = lhs.id == rhs.id
        
        return equalRotation && equalDiscard && equalDealt && id
    }
}
