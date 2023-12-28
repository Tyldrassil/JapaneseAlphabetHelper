//
//  ContentView.swift
//  HiraKataGanaAlphabet
//
//  Created by Thomas Ditman on 27/12/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {

    var body: some View {
        SetOfCharacters(selectedCharacters: ColumnSelector(vowels: true, kColumn: true, sColumn: true, tColumn: true, nColumn: true, hColumn: false, mColumn: false, rColumn: false, yColumn: false, wColumn: false))
    }
}

#Preview {
    ContentView()
}
