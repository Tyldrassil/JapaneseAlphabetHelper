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
    
    if (character.romanji == input.lowercased()) {
        return true
    } else {
        return false
    }
    
}

func fetchAlphabetSet(selectedColumns: ColumnSelector) -> [Character] {
    
    var selectedCharacters: [Character] = []
    var idNum: Int = 0
    
    
    //Adding in vowels
    if (selectedColumns.vowels) {
        selectedCharacters.append(Character(id: idNum, hiragana: "あ", katakana: "ア", romanji: "a")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "い", katakana: "イ", romanji: "i")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "う", katakana: "ウ", romanji: "u")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "え", katakana: "エ", romanji: "e")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "お", katakana: "オ", romanji: "o")); idNum += 1
    }
    
    //Adding in K-Column
    if (selectedColumns.kColumn) {
        selectedCharacters.append(Character(id: idNum, hiragana: "か", katakana: "カ", romanji: "ka")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "き", katakana: "キ", romanji: "ki")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "く", katakana: "ク", romanji: "ku")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "け", katakana: "ケ", romanji: "ke")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "こ", katakana: "コ", romanji: "ko")); idNum += 1
    }
    
    //Adding in S-Column
    if (selectedColumns.sColumn) {
        selectedCharacters.append(Character(id: idNum, hiragana: "さ", katakana: "サ", romanji: "sa")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "し", katakana: "シ", romanji: "si")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "す", katakana: "ス", romanji: "su")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "せ", katakana: "セ", romanji: "se")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "そ", katakana: "ソ", romanji: "so")); idNum += 1
    }
    
    //Adding in T-Column
    if (selectedColumns.tColumn) {
        selectedCharacters.append(Character(id: idNum, hiragana: "た", katakana: "タ", romanji: "ta")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "ち", katakana: "チ", romanji: "chi")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "つ", katakana: "ツ", romanji: "tsu")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "て", katakana: "テ", romanji: "te")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "と", katakana: "ト", romanji: "to")); idNum += 1
    }
    
    //Adding in N-Column
    if (selectedColumns.nColumn) {
        selectedCharacters.append(Character(id: idNum, hiragana: "な", katakana: "ナ", romanji: "na")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "に", katakana: "ニ", romanji: "ni")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "ぬ", katakana: "ヌ", romanji: "nu")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "ね", katakana: "ネ", romanji: "ne")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "の", katakana: "ノ", romanji: "no")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "ん", katakana: "ン", romanji: "n")); idNum += 1
    }
    
    
    return selectedCharacters
}
