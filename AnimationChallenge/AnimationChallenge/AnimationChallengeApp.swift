//
//  AnimationChallengeApp.swift
//  AnimationChallenge
//
//  Created by Pedro Larry Rodrigues Lopes on 02/04/25.
//

import SwiftUI
import SwiftData

@main
struct AnimationChallengeApp: App {

    var body: some Scene {
        WindowGroup {
            AnimatedCardView(viewModel: .init())
        }
    }
}
