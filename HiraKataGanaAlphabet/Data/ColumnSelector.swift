//
//  AlphabetSelectionHelper.swift
//  HiraKataGanaAlphabet
//
//  Created by Thomas Ditman on 27/12/2023.
//

import Foundation

struct ColumnSelector {
    
    var  vowels: Bool = false
    var kColumn: Bool = false
    var sColumn: Bool = false
    var tColumn: Bool = false
    var nColumn: Bool = false
    var hColumn: Bool = false
    var mColumn: Bool = false
    var rColumn: Bool = false
    var yColumn: Bool = false
    var wColumn: Bool = false
    
    
    func anySelected() -> Bool {
        
        if (
            vowels  ||
            kColumn ||
            sColumn ||
            tColumn ||
            nColumn ||
            hColumn ||
            nColumn ||
            rColumn ||
            yColumn ||
            wColumn 
        ) {
            return true
        }
        
        return false
        
    }
    
    func allSelected() -> Bool {
        
        if (
            vowels  &&
            kColumn &&
            sColumn &&
            tColumn &&
            nColumn &&
            hColumn &&
            nColumn &&
            rColumn &&
            yColumn &&
            wColumn 
        ) {
            return true
        }
        
        return false
    }

}
