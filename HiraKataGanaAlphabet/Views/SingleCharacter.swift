//
//  SingleCharacter.swift
//  HiraKataGanaAlphabet
//
//  Created by Thomas Ditman on 27/12/2023.
//

import SwiftUI

struct SingleCharacter: View {
    
    var character: Character
    
    var body: some View {
        Text(character.hiragana)
        Text(character.katakana)
        Text(character.romanji)
    }
}

#Preview {
    
    //var exampleCharacter =
    
    SingleCharacter(character: Character(hiragana: "あ", katakana: "ア", romanji: "a"))
}
