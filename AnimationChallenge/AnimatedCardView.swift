//
//  ContentView.swift
//  AnimationChallenge
//
//  Created by Pedro Larry Rodrigues Lopes on 02/04/25.
//

import SwiftUI
import SwiftData

struct AnimatedCardView: View {
    
    @StateObject var viewModel: AnimatedCardViewModel
    @Namespace private var cardStackNamespace
    @Namespace private var cardGridNamespace
    
    var body: some View {
        VStack {
            LazyVGrid(columns: [.init(), .init()]) {
                dealtCards
            }
            HStack {
                undealtCards
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        .border(Color.blue)
    }
    
    private var undealtCards: some View {
        ForEach(viewModel.undealtCards){ card in
            CardView(card: card, namespace: cardGridNamespace, vm: viewModel)
        }
    }
    
    @ViewBuilder
    private var dealtCards: some View {
        ForEach(viewModel.dealtCards){ card in
            CardView(card: card, namespace: cardGridNamespace, vm: viewModel)
        }
    }
}

struct CardView: View {
    
    @State var card: Card
    var namespace: Namespace.ID
    @State var rotation = 0.0
    @ObservedObject var vm: AnimatedCardViewModel
    @State private var showView = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.orange)
                .aspectRatio(2/3,contentMode: .fit)
                .frame(maxHeight: 200)
            Text(card.emoji)
                .font(.largeTitle)
        }
        .rotation3DEffect(.degrees(rotation), axis: (0,1,0))
        .matchedGeometryEffect(id: card.id, in: namespace)
        .onTapGesture {
            withAnimation (.default){
                vm.chooseCard(card)
                rotation += 360
            }
            rotation = showView ? 180 : 0
        }
    }
}

struct ContentView: View {
    @State private var showView = false
    @State private var rotationAngle: Double = 0
    
    var body: some View {
        VStack {
            Image(systemName: "chevron.up.circle")
                .resizable()
                .frame(width: 50, height: 50)
                .rotationEffect(Angle(degrees: rotationAngle))
            
        }
        .onTapGesture {
            
            showView.toggle()
            withAnimation(.easeInOut(duration: 0.3)) {
                rotationAngle += 180
            }
            
        }
    }
}


struct test: View {
    
    @State var up: Bool = false
    @Namespace private var app
    
    var body: some View {
        if up {
            RoundedRectangle(cornerRadius: 15)
                .matchedGeometryEffect(id: "mesmacoisa", in: app)
                .frame(width: 100, height: 100)
                .onTapGesture {
                    withAnimation {
                        up.toggle()
                    }
                    
                }
               
        }
        
        Spacer()
        
        if !up {
            RoundedRectangle(cornerRadius: 15)
                .matchedGeometryEffect(id: "mesmacoisa", in: app)
                .frame(width: 300, height: 100)
                .onTapGesture {
                    withAnimation {
                        up.toggle()
                    }
                }
                
        }
    }
}


#Preview {
    //ContentView()
    AnimatedCardView(viewModel: .init())
    //test()
}
