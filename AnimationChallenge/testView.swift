//
//  testView.swift
//  AnimationChallenge
//
//  Created by Pedro Larry Rodrigues Lopes on 08/04/25.
//

import SwiftUI

struct testView: View {
    
    let vm = viewmodel2()
    
    var body: some View {
        HStack {
            VStack{
                ForEach(vm.books) { book in
                    Text(book.name)
                }
            }
            VStack {
                ForEach(vm.magazine) { book in
                    Text(book.name)
                }
            }
            
            Button("add book"){
                vm.addBook()
            }
                
        }
    }
}

#Preview {
    testView()
}
