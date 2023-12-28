//
//  Character.swift
//  HiraKataGanaAlphabet
//
//  Created by Thomas Ditman on 27/12/2023.
//

import Foundation


struct Character: Identifiable, Hashable {
    
    var id: Int
    var hiragana: String
    var katakana: String
    var romanji: String
    
}
