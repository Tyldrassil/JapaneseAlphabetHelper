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
        //var character2: Character = Character(hiragana: "し", katakana: "シ", romanji: "shi")
        //var character3: Character = Character(hiragana: "や", katakana: "ヤ", romanji: "ya")
        
        //Hiragana check
        let result11 = compareCharacterToInput(character: character1, input: "a")
        let result12 = compareCharacterToInput(character: character1, input: "b")
        let result13 = compareCharacterToInput(character: character1, input: "1123  12451sfasfkhgjasdniuh")
        
        XCTAssertTrue(result11)
        XCTAssertFalse(result12)
        XCTAssertFalse(result13)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
