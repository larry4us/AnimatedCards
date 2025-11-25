//
//  test.swift
//  AnimationChallenge
//
//  Created by Pedro Larry Rodrigues Lopes on 08/04/25.
//

import Foundation
//import SwiftUI

@Observable class viewmodel2 {
    @ObservationIgnored var books: [Book] = [.init(name: "jaide")]
    var magazine: [Magazine] = [.init(name: "bob")]
    
    func addBook() {
        books.append(.init(name: "jaide\(books.count)"))
    }
    
    func addMagazine() {
        magazine.append(.init(name: "bob\(magazine.count)"))
    }
}

struct Book: Identifiable{
    let id = UUID()
    var name: String
}

struct Magazine: Identifiable {
    let id = UUID()
    var name: String
}
