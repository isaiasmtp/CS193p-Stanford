//
//  PalleteChooser.swift
//  EmojiArt
//
//  Created by Isaias Pontes on 12/04/21.
//

import SwiftUI

struct PalleteChooser: View {
    @ObservedObject var document: EmojiArtDocument
    
    @Binding var chosenPalette: String
        
    var body: some View {
        HStack{
            Stepper(onIncrement: {
                chosenPalette = document.palette(after: chosenPalette)
            }, onDecrement: {
                chosenPalette = document.palette(before: chosenPalette)
            }, label: { EmptyView() })
            Text(document.paletteNames[chosenPalette] ?? "")
        }
        .fixedSize(horizontal: true, vertical: false)
        .onAppear{ chosenPalette = document.defaultPalette }
    }
}
