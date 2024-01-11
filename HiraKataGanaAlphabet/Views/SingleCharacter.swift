//
//  SingleCharacter.swift
//  HiraKataGanaAlphabet
//
//  Created by Thomas Ditman on 27/12/2023.
//

import SwiftUI


/**
 Just a card that displays a single character
*/
 struct SingleCharacter: View {
    
    //Character to be displayed, contains data for both hiragana and katakana
    var character: Character
    
    //If false, Hiragana, if true, Katakana
    var characterType: Bool
    
    var body: some View {
        GeometryReader{ r in
            RoundedRectangle(
                cornerRadius: 25.0
            )
            .fill(.white)
            .stroke(.black)
            .overlay {
                characterType ?
                Text(character.katakana).font(.system(size: r.size.height > r.size.width ? r.size.width: r.size.height)) :
                Text(character.hiragana).font(.system(size: r.size.height > r.size.width ? r.size.width: r.size.height))
            }
        }
        
        
    }
}

#Preview {
    SingleCharacter(character: Character(id: 1, hiragana: "あ", katakana: "ア", romanji: "a"), characterType: false)
}
