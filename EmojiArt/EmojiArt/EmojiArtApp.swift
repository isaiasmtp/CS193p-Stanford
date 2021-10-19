//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Isaias Pontes on 08/04/21.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    var store = EmojiArtDocumentStore(named: "Emoji Art");
    
    var body: some Scene {
        
        WindowGroup {
//            EmojiArtDocumentView(document: EmojiArtDocument())
            
            EmojiArtDocumentChooser().environmentObject(store)
        }
    }
}
