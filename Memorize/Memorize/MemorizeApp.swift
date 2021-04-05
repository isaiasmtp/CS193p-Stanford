//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Isaias Martins on 05/03/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
