//
//  HiraKataGanaAlphabetTests.swift
//  HiraKataGanaAlphabetTests
//
//  Created by Thomas Ditman on 27/12/2023.
//

import XCTest
@testable import HiraKataGanaAlphabet

final class HiraKataGanaAlphabetTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testcompareCharacterToInput() throws {
        
        var character1: Character = Character(hiragana: "あ", katakana: "ア", romanji: "a")
        var character2: Character = Character(hiragana: "し", katakana: "シ", romanji: "shi")
        //var character3: Character = Character(hiragana: "や", katakana: "ヤ", romanji: "ya")
        
        //Check1
        let result11 = compareCharacterToInput(character: character1, input: "a")
        let result12 = compareCharacterToInput(character: character1, input: "b")
        let result13 = compareCharacterToInput(character: character1, input: "1123  12451sfasfkhgjasdniuh")
        
        XCTAssertTrue(result11)
        XCTAssertFalse(result12)
        XCTAssertFalse(result13)
        
        //Check2
        let result21 = compareCharacterToInput(character: character2, input: "shi")
        let result22 = compareCharacterToInput(character: character2, input: "shu")
        let result23 = compareCharacterToInput(character: character2, input: "1123  12451sfasfkhgjasdniuh")
        
        XCTAssertTrue(result21)
        XCTAssertFalse(result22)
        XCTAssertFalse(result23)
        
    }
    
    //TODO: Just a count test, should actually check array
    func testfetchAlphabetSet() throws {
        
        var selection: ColumnSelector = ColumnSelector(vowels: false, kColumn: false, sColumn: false, tColumn: false, nColumn: false, hColumn: false, mColumn: false, rColumn: false, yColumn: false, wColumn: false)
        
        let result1 = fetchAlphabetSet(selectedColumns: selection)
        
        XCTAssertEqual(result1.count, 0, "Should be empty")
        
        selection.vowels = true
        
        let result2 = fetchAlphabetSet(selectedColumns: selection)
        
        XCTAssertEqual(result2.count, 5, "Should be 5 in array")
        
        selection.vowels = false
        selection.kColumn = true
        selection.sColumn = true
        
        let result3 = fetchAlphabetSet(selectedColumns: selection)
        
        XCTAssertEqual(result3.count, 10, "Should be 5 in array")
        
    }
    
    func testFetchAlphabetPerformance() throws {
        
        var selection: ColumnSelector = ColumnSelector(vowels: true, kColumn: true, sColumn: true, tColumn: true, nColumn: true, hColumn: true, mColumn: true, rColumn: true, yColumn: true, wColumn: true)
        
        self.measure {
            let result = fetchAlphabetSet(selectedColumns: selection)
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
