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
                                    height: r.size.height*0.5)
                                
                                //Textbox input field
                                TextBox(textInput: $textInput)
                                    .frame(
                                        width: r.size.width*0.75,
                                        height: r.size.height*0.1
                                    )
                                
                                
                                
                                
                                //button for checking if correct and scrolling onwards
                                RoundedRectangle(cornerRadius: 25.0)
                                    .stroke(.black)
                                    .fill(.white)
                                    .frame(
                                        width: r.size.width*0.5,
                                        height: r.size.height*0.1
                                    )
                                    .overlay {
                                        Text("\(currentChar+1)")
                                    }
                                    .onTapGesture {
                                        currentChar += 1
                                        
                                        //TODO: Will later check if answer is correct
                                        withAnimation {
                                            s.scrollTo(currentChar)
                                        }
                                        
                                    }
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

#Preview {
    SetOfCharacters(selectedCharacters: ColumnSelector(vowels: true, kColumn: true, sColumn: true, tColumn: true, nColumn: true, hColumn: false, mColumn: false, rColumn: false, yColumn: false, wColumn: false))
}
