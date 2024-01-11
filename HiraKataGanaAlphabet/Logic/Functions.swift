//
//  Functions.swift
//  HiraKataGanaAlphabet
//
//  Created by Thomas Ditman on 27/12/2023.
//

import Foundation

// Hiragana alphabet for copy pasting
// あいうえお かきくけこ さしすせそ たちつてとっ なにぬねのん はひふへほ まみむめも やゆよ ゃゅょ わを らりるれろ

// Katakana for copy paste
// アイウエオ カキクケコ サシスセソ タチツテトッ ナニヌネノン ハヒフヘホ マミムメモ ヤユヨ ャュョ ワヲ ラリルレロ


/**
 TODO: Have something happen when almost correct, seperate from completely correct
 */
func compareCharacterToInput(character: Character, input: String) -> Bool {
    
    if (character.romanji == input.lowercased()) {
        return true
    } else {
        return false
    }
    
}

func fetchAlphabetSet(selectedColumns: ColumnSelector, randomize: Bool) -> [Character] {
    
    var selectedCharacters: [Character] = []
    var idNum: Int = 0
    var shuffledCharacters: [Character] = []
    
    
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
        selectedCharacters.append(Character(id: idNum, hiragana: "し", katakana: "シ", romanji: "shi")); idNum += 1
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
    
    //Adding in h-Column
    if (selectedColumns.hColumn) {
        selectedCharacters.append(Character(id: idNum, hiragana: "は", katakana: "ハ", romanji: "ha")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "ひ", katakana: "ハ", romanji: "hi")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "ふ", katakana: "フ", romanji: "fu")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "へ", katakana: "ヘ", romanji: "he")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "ほ", katakana: "ホ", romanji: "ho")); idNum += 1
    }
    
    //Adding in m-Column
    if (selectedColumns.mColumn) {
        selectedCharacters.append(Character(id: idNum, hiragana: "ま", katakana: "マ", romanji: "ma")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "み", katakana: "ミ", romanji: "mi")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "む", katakana: "ム", romanji: "mu")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "め", katakana: "メ", romanji: "me")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "も", katakana: "モ", romanji: "mo")); idNum += 1
        
    }
    
    //Adding in y-Column
    if (selectedColumns.yColumn) {
        selectedCharacters.append(Character(id: idNum, hiragana: "や", katakana: "ヤ", romanji: "ya")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "ゆ", katakana: "ユ", romanji: "yu")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "よ", katakana: "ヨ", romanji: "yo")); idNum += 1
        
    }
    
    //Adding in r-Column
    if (selectedColumns.rColumn) {
        selectedCharacters.append(Character(id: idNum, hiragana: "ら", katakana: "ラ", romanji: "ra")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "り", katakana: "リ", romanji: "ri")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "る", katakana: "ル", romanji: "ru")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "れ", katakana: "レ", romanji: "re")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "ろ", katakana: "ロ", romanji: "ro")); idNum += 1
        
    }
    
    //Adding in w-Column
    if (selectedColumns.wColumn) {
        selectedCharacters.append(Character(id: idNum, hiragana: "わ", katakana: "ワ", romanji: "wa")); idNum += 1
        selectedCharacters.append(Character(id: idNum, hiragana: "を", katakana: "ヲ", romanji: "wo")); idNum += 1
    }
    
    
    //I really hate this solution. Shuffles a list, then uses that list to make a new list with proper ids.
    //This is due to id's being used to scroll in SetOfCharacters.
    if (randomize) {
        selectedCharacters.shuffle()
        
        idNum = 0
        
        selectedCharacters.forEach { character in
            shuffledCharacters.append(Character(id: idNum, hiragana: character.hiragana, katakana: character.katakana, romanji: character.romanji))
            idNum += 1
        }
        
        return shuffledCharacters
    }
    
    
    return selectedCharacters
}
