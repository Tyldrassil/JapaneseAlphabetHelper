//
//  SetOfCharacters.swift
//  HiraKataGanaAlphabet
//
//  Created by Thomas Ditman on 28/12/2023.
//

import SwiftUI

struct SetOfCharacters: View {
    
    var selectedCharacters: ColumnSelector
    
    var characterArray: [Character]
    
    @State private var currentChar: Int = 0
    @State private var textInput: String = ""
    
    @State var shakeStart: Bool = false
    
    var body: some View {
        //Used to determine size of screen
        GeometryReader { r in
            
            //Used to determine position in scroll
            ScrollViewReader { s in
                
                //used for actual scrolling control
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    //Used for horizontal scrolling
                    LazyHStack() {
                        
                        //For each letter in selected alphabet, show the letter
                        ForEach(characterArray) { i in
                            
                            //Stack symbol over button
                            VStack{
                                SingleCharacter(
                                    character: i,
                                    characterType: false
                                )
                                .frame(
                                    width: r.size.width*0.8,
                                    height: r.size.height*0.5
                                )
                                .offset(x: shakeStart ? 30 : 0)
                                
                                
                                //Textbox input field
                                TextBox(textInput: $textInput)
                                    .frame(
                                        width: r.size.width*0.75,
                                        height: r.size.height*0.1
                                    )
                                
                                
                                AdvanceButton(
                                    currentChar: $currentChar,
                                    textInput: $textInput,
                                    shakeStart: $shakeStart,
                                    characterArray: characterArray,
                                    scrollValue: s, geoValue: r
                                ).frame(
                                    width: r.size.width*0.5,
                                    height: r.size.height*0.1
                                )
                                
                            }
                            .padding(.horizontal, r.size.width*0.1)
                        }
                    }
                    
                }
                .scrollDisabled(true)
                //.scrollPosition(id: currentChar)
                
            }
            
        }//.ignoresSafeArea(.keyboard)
    }
    
    init(selectedCharacters: ColumnSelector) {
        characterArray =
        fetchAlphabetSet(selectedColumns: selectedCharacters)
        self.selectedCharacters = selectedCharacters
    }
    
    
}

/**
 Just the textbox for input of the displayed letter/symbol
 */
struct TextBox : View {
    
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
    
    func checkInput() {
        //Checks if input is correct, only advanced on correct.
        if (compareCharacterToInput(character: characterArray[currentChar], input: textInput)) {
            
            currentChar += 1
            textInput = ""
            
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
    SetOfCharacters(selectedCharacters: ColumnSelector(vowels: true, kColumn: true, sColumn: true, tColumn: true, nColumn: true, hColumn: false, mColumn: false, rColumn: false, yColumn: false, wColumn: false))
}
