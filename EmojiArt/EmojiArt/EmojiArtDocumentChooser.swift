//
//  EmojiArtDocumentChooser.swift
//  EmojiArt
//
//  Created by Isaias Pontes on 28/08/21.
//

import SwiftUI

struct EmojiArtDocumentChooser: View {
    @EnvironmentObject var store: EmojiArtDocumentStore
    
    var body: some View {
        NavigationView{
            List{
                ForEach(store.documents) { document in
                    NavigationLink(destination: EmojiArtDocumentView(document: document)){
                        Text(self.store.name(for: document))
                    }
                }
            }
        }
    }
}

struct EmojiArtDocumentChooser_Previews: PreviewProvider {
    static var previews: some View {
        EmojiArtDocumentChooser()
    }
}
