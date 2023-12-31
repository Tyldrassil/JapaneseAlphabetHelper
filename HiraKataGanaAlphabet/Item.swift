//
//  Item.swift
//  HiraKataGanaAlphabet
//
//  Created by Thomas Ditman on 27/12/2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
