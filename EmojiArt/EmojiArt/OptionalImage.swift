//
//  OptionalImage.swift
//  EmojiArt
//
//  Created by Isaias Pontes on 11/04/21.
//

import SwiftUI

struct OptionalImage: View {
    var uiImage: UIImage?
    
    var body: some View{
        Group {
            if uiImage != nil {
                Image(uiImage: uiImage!)
            }
        }
    }
}
