//
//  StringTests.swift
//  
//
//  Created by dejaWorks on 07/03/2020.
//


import XCTest
import Foundation

@testable import DJWVTExtensions

final class StringTests: XCTestCase {

    func testTextPixelPosition(){
        let text = "Abcdefg"
        let font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        let pos = text.position(of: 3, usedFont: font)
        
        XCTAssertEqual(pos, 25, accuracy: 1)
    }

    func testTextPixelWhenWrongIndexGiven(){
        let text = "Abcdefg"
        let font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        let pos = text.position(of: 7, usedFont: font) // last char
        let pos2 = text.position(of: 27, usedFont: font) // wrong index
        
        XCTAssertEqual(pos, 54, accuracy: 1)
        XCTAssertEqual(pos, pos2, accuracy: 1) // wrong index limited to last
    }
}
