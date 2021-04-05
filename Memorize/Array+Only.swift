//
//  Array+Only.swift
//  Memorize
//
//  Created by Isaias Pontes on 05/04/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
