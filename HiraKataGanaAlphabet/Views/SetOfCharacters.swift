//
//  SetOfCharacters.swift
//  HiraKataGanaAlphabet
//
//  Created by Thomas Ditman on 28/12/2023.
//

//TODO: Close window/show score when done with final character
//TODO: Add scoring system
//TODO: Add incorrect tracker
//TODO: Add better indication for correct answer
//TODO: Add remaining characters
//TODO: Extra: Add building characters from individual strokes. Likely seperate mode
//TODO: Maybe a little info button to display correct answer if repeatedly wrong answer

import SwiftUI

struct SetOfCharacters: View {
    
    var selectedCharacters: ColumnSelector
    var characterArray: [Character]
    var alphabet: Bool
    
    @State private var currentChar: Int = 0
    @State private var textInput: String = ""
    @State private var isLastChar: Bool = false
    
    //When true, a shake is happening on the single character window
    @State var shakeStart: Bool = false
    
    var body: some View {
        //Used to determine size of screen
        GeometryReader { r in
            
            //Used to determine position in scroll, variable also used to scroll
            ScrollViewReader { s in
                
                VStack {
                    
                    //used for defining scroll area, what gets scrolled
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        //Used for horizontal scrolling
                        LazyHStack() {
                            
                            //For each letter in selected alphabet, show the letter
                            ForEach(characterArray) { i in
                                
                                //Stack symbol over button
                                
                                SingleCharacter(
                                    character: i,
                                    characterType: alphabet
                                )
                                .frame(
                                    width: r.size.width*0.8,
                                    height: r.size.height*0.5
                                )
                                //This defines size of shake
                                .offset(x: shakeStart ? 30 : 0)
                            }.padding(.horizontal, r.size.width*0.1)
                        }
                        
                    }
                    .scrollDismissesKeyboard(.never)
                    .scrollDisabled(false)
                    //.scrollPosition(id: currentChar)
                    //Textbox input field
                    TextBox(textInput: $textInput)
                        .frame(
                            width: r.size.width*0.75,
                            height: r.size.height*0.1
                        )
                    
                    if (isLastChar) {
                        
                        FinishQuizButton(
                            scrollValue: s,
                            geoValue: r
                        ).frame(
                            width: r.size.width*0.5,
                            height: r.size.height*0.1
                        )
                        
                    } else {
                        
                        AdvanceButton(
                            currentChar: $currentChar,
                            textInput: $textInput,
                            shakeStart: $shakeStart, 
                            isLastChar: $isLastChar,
                            characterArray: characterArray,
                            scrollValue: s, geoValue: r
                        ).frame(
                            width: r.size.width*0.5,
                            height: r.size.height*0.1
                        )
                    }
                    
                    
                }
            }
            
        }
    }
    
    init(selectedCharacters: ColumnSelector, randomize: Bool, alphabet: Bool) {
        characterArray = fetchAlphabetSet(selectedColumns: selectedCharacters, randomize: randomize)
        self.selectedCharacters = selectedCharacters
        self.alphabet = alphabet
        
    }
}

/**
 Finish run button, takes you back to main screen
 */
struct FinishQuizButton : View {
    
    @Environment(\.dismiss) private var dismiss
    
    let scrollValue: ScrollViewProxy
    let geoValue: GeometryProxy
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .stroke(.black)
            .fill(.white)
            .overlay {
                Text("Finish Quiz")
            }
            .onTapGesture { dismiss() }
    }
}

/**
 Just the textbox for input of the displayed letter/symbol
 */
struct TextBox : View {
    
    //Binding comes from parent view
    @Binding var textInput: String
    
    var body: some View {
        GeometryReader { r in
            RoundedRectangle(cornerRadius:  25.0)
                .stroke(.black)
                .fill(.white)
                .overlay {
                    TextField(
                        "Latin Spelling",
                        text: $textInput
                    )
                    .multilineTextAlignment(.center)
                    .frame(height: r.size.height)
                }
        }
    }
}

/**
 Subview for advancing to next character
 */
struct AdvanceButton : View {
    
    @Binding var currentChar: Int
    @Binding var textInput: String
    @Binding var shakeStart: Bool
    @Binding var isLastChar: Bool
    
    let characterArray: [Character]
    let scrollValue: ScrollViewProxy
    let geoValue: GeometryProxy
    
    var body: some View {
        //button for checking if correct and scrolling onwards
        RoundedRectangle(cornerRadius: 25.0)
            .stroke(.black)
            .fill(.white)
            .overlay {
                Text("Check Answer")
            }
            .onTapGesture { checkInput() }
    }
    
    /**
     function checks if input is correct, if correct it advances to next char, if incorrect it shakes the window.
     */
    func checkInput() {
        //Checks if input is correct, only advanced on correct.
        if (compareCharacterToInput(character: characterArray[currentChar], input: textInput)) {
            
            currentChar += 1
            textInput = ""
            
            //Tells parent view that this is the last letter, for changing finish button
            if (currentChar == characterArray.count-1) {
                isLastChar = true
            }
            
            withAnimation {
                scrollValue.scrollTo(currentChar)
            }
        } else {
            shakeStart = true
            withAnimation(
                Animation.spring(
                    response: 0.2,
                    dampingFraction: 0.2,
                    blendDuration: 0.2
                )
            ) {
                shakeStart = false
            }
        }
    }
}


#Preview {
    SetOfCharacters(selectedCharacters: ColumnSelector(vowels: false, kColumn: false, sColumn: false, tColumn: false, nColumn: false, hColumn: false, mColumn: false, rColumn: false, yColumn: false, wColumn: true), randomize: false, alphabet: true)
}
