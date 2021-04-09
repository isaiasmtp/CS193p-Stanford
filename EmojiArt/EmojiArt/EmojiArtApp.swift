//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Isaias Pontes on 08/04/21.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: EmojiArtDocument())
        }
    }
}
