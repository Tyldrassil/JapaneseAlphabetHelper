//
//  Functions.swift
//  HiraKataGanaAlphabet
//
//  Created by Thomas Ditman on 27/12/2023.
//

import Foundation

// Hiragana alphabet for copy pasting
// あいうえお かきくけこ さしすせそ たちつてとっ なにぬねのん はひふへほ まみむめも やゆよ ゃゅょ らりるれろ

// Katakana for copy paste
// アイウエオ カキクケコ サシスセソ タチツテトッ ナニヌネノン ハヒフヘホ マミムメモ ヤユヨ ャュョ ラリルレロ

func compareCharacterToInput(character: Character, input: String) -> Bool {
    
    if (character.romanji == input) {
        return true
    } else {
        return false
    }
    
}

func fetchAlphabetSet(selectedColumns: ColumnSelector) -> [Character] {
    
    var selectedCharacters: [Character] = []
    
    
    //Adding in vowels
    if (selectedColumns.vowels) {
        selectedCharacters.append(Character(hiragana: "あ", katakana: "ア", romanji: "a"))
        selectedCharacters.append(Character(hiragana: "い", katakana: "イ", romanji: "e"))
        selectedCharacters.append(Character(hiragana: "う", katakana: "ウ", romanji: "i"))
        selectedCharacters.append(Character(hiragana: "え", katakana: "エ", romanji: "u"))
        selectedCharacters.append(Character(hiragana: "お", katakana: "オ", romanji: "o"))
    }
    
    //Adding in K-Column
    if (selectedColumns.kColumn) {
        selectedCharacters.append(Character(hiragana: "か", katakana: "カ", romanji: "ka"))
        selectedCharacters.append(Character(hiragana: "き", katakana: "キ", romanji: "ki"))
        selectedCharacters.append(Character(hiragana: "く", katakana: "ク", romanji: "ku"))
        selectedCharacters.append(Character(hiragana: "け", katakana: "ケ", romanji: "ke"))
        selectedCharacters.append(Character(hiragana: "こ", katakana: "コ", romanji: "ko"))
    }
    
    //Adding in S-Column
    if (selectedColumns.sColumn) {
        selectedCharacters.append(Character(hiragana: "さ", katakana: "サ", romanji: "sa"))
        selectedCharacters.append(Character(hiragana: "し", katakana: "シ", romanji: "si"))
        selectedCharacters.append(Character(hiragana: "す", katakana: "ス", romanji: "su"))
        selectedCharacters.append(Character(hiragana: "せ", katakana: "セ", romanji: "se"))
        selectedCharacters.append(Character(hiragana: "そ", katakana: "ソ", romanji: "so"))
    }
    
    return selectedCharacters
}
