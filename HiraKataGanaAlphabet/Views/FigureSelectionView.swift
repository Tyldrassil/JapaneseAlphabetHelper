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
    
    var body: some View {
        
        NavigationStack {
            
            
            
            GeometryReader { r in
                
                VStack {
                    
                    Text("Please select the columns you would like to practice")
                    
                    List {
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
                        
                    }
                    
                    Toggle(isOn: $randomize) {
                        Text("Randomize practice?")
                    }
                    
                    RoundedRectangle(cornerRadius:  25.0)
                        .stroke(.black)
                        .fill(.white)
                        .overlay {
                            NavigationLink(
                                destination: 
                                    SetOfCharacters(
                                        selectedCharacters: selection,
                                        randomize: randomize
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

#Preview {
    FigureSelectionView()
}
