//
//  DoubleTests.swift
//  
//
//  Created by dejaWorks on 05/03/2020.
//

import XCTest
import Foundation

@testable import DJWVTExtensions

final class DoubleTests: XCTestCase {

    func testFractionSeperationForPositiveNumbers(){
        let number = 12.34
        
        XCTAssertEqual(number.integerPart(), "12")
        XCTAssertEqual(number.fractionalPart(), "34")
    }
    
    func testFractionSeperationForPositiveNumbersLong(){
        let number = 123.45678
        
        XCTAssertEqual(number.integerPart(), "123")
        XCTAssertEqual(number.fractionalPart(5), "45678")
    }
    
    func testFractionSeperationForPositiveNumbersLong2(){
        let number = 98765.4321
        
        XCTAssertEqual(number.integerPart(), "98765")
        XCTAssertEqual(number.fractionalPart(4), "4321")
    }
    
    func testFractionSeperationForPositiveNumbersLong3(){
        let number = 98765.4321
        
        XCTAssertEqual(number.integerPart(), "98765")
        XCTAssertEqual(number.fractionalPart(1), "4")
    }
    
    func testFractionSeperationForNegativeNumbers(){
        let number = -12.34
        
        XCTAssertEqual(number.integerPart(), "-12")
        XCTAssertEqual(number.fractionalPart(), "34")
    }
    
    func testFractionSeperationForNegativeNumbersLong(){
        let number = -123.45678
        
        XCTAssertEqual(number.integerPart(), "-123")
        XCTAssertEqual(number.fractionalPart(5), "45678")
    }
    
    func testFractionSeperationForNegativeNumbersLong2(){
        let number = -98765.4321
        
        XCTAssertEqual(number.integerPart(), "-98765")
        XCTAssertEqual(number.fractionalPart(4), "4321")
    }
    func testFractionSeperationForNegativeNumbersLong3(){
        let number = -98765.4321
        
        XCTAssertEqual(number.integerPart(), "-98765")
        XCTAssertEqual(number.fractionalPart(1), "4")
    }
}
