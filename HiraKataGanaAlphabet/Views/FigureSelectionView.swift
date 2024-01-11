//
//  FigureSelectionView.swift
//  HiraKataGanaAlphabet
//
//  Created by Thomas Ditman on 02/01/2024.
//

import SwiftUI

/**
 View for selecting the kana you wish to practice
 */
struct FigureSelectionView: View {
    
    @State var selection = ColumnSelector()
    @State var randomize = false
    @State var alphabet = false
    
    var body: some View {
        
        //Indicates what parts of the screen will be navigated (all of it)
        NavigationStack {
            
            //USED TO DETERMINED size of screen
            GeometryReader { r in
                
                VStack {
                    
                    //Selection string
                    Text("Please select the columns you would like to practice")
                    
                    //Hardcoded list for the kana selection.
                    List {
                        
                        if (!selection.allSelected()) {
                            //Select everything
                            Button(action: {
                                selectAll()
                            },
                                   label: {
                                Text("Enable all")
                            })
                        }
                        
                        
                        //Vowel select
                        Toggle(isOn: $selection.vowels) {
                            Text("Vowels")
                        }.padding()
                        
                        //K
                        Toggle(isOn: $selection.kColumn) {
                            Text("K-Column")
                        }.padding()
                        
                        //S
                        Toggle(isOn: $selection.sColumn) {
                            Text("S-Column")
                        }.padding()
                        
                        //T
                        Toggle(isOn: $selection.tColumn) {
                            Text("T-Column")
                        }.padding()
                        
                        //N
                        Toggle(isOn: $selection.nColumn) {
                            Text("N-Column")
                        }.padding()
                        
                        //H
                        Toggle(isOn: $selection.nColumn) {
                            Text("N-Column")
                        }.padding()
                        
                        //M
                        Toggle(isOn: $selection.hColumn) {
                            Text("H-Column")
                        }.padding()
                        
                        //R
                        Toggle(isOn: $selection.rColumn) {
                            Text("R-Column")
                        }.padding()
                        
                        //Y
                        Toggle(isOn: $selection.yColumn) {
                            Text("Y-Column")
                        }.padding()
                        
                        //W
                        Toggle(isOn: $selection.wColumn) {
                            Text("W-Column")
                        }.padding()
                        
                    }
                    
                    //Select to randomize order of characters
                    Toggle(isOn: $randomize) {
                        Text("Randomize practice?")
                    }
                    //if true katakana, if false hiragana, text updates accordingly
                    Toggle(isOn: $alphabet) {
                        Text(!alphabet ? "Hiragana" : "Katakana")
                    }
                    
                    //TODO: if none are selected, don't advance
                    if (selection.anySelected()) {
                        RoundedRectangle(cornerRadius:  25.0)
                            .stroke(.black)
                            .fill(.white)
                            .overlay {
                                NavigationLink(
                                    destination:
                                        SetOfCharacters(
                                            selectedCharacters: selection,
                                            randomize: randomize,
                                            alphabet: alphabet
                                        ),
                                    label: {
                                        Text("Start Practice")
                                    })
                                
                                .multilineTextAlignment(.center)
                                
                            }.frame(
                                width: r.size.width*0.8,
                                height: r.size.height*0.15
                            )
                    }
                    
                    
                }
            }
        }
    }
    
    func selectAll() {
        selection.vowels = true
        selection.kColumn = true
        selection.sColumn = true
        selection.tColumn = true
        selection.nColumn = true
        selection.hColumn = true
        selection.mColumn = true
        selection.rColumn = true
        selection.yColumn = true
        selection.wColumn = true
        
    }
}

#Preview {
    FigureSelectionView()
}
