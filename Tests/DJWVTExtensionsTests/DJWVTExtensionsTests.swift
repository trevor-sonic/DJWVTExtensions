import XCTest
import Foundation

@testable import DJWVTExtensions

final class DJWVTExtensionsTests: XCTestCase {
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct
//        // results.
//        //XCTAssertEqual(DJWVTExtensions.text, "Hello, World!")
//    }
//
//    static var allTests = [
//        ("testExample", testExample),
//    ]
    
    func testStringParser(){
        let text = "This text contains [Am] chord."
        let result = text.takeBetween(from: "[", to: "]")
        
        XCTAssertEqual(result, "Am")
    }
    
    func testTakeMultiBetweenBracets(){
        let text = "Chords are [A♭m], [E♯m] and [F#7]"
        let result = text.takeMultiBetweenBracets()

        XCTAssertEqual(result, ["A♭m","E♯m", "F#7"])
    }
    
    func testDoubleRoundWithResolution(){
    
        let n1:Double = 10.12
        XCTAssertEqual( n1.roundWith(0.1), 10.1 )
        XCTAssertEqual( n1.roundWith(0.05), 10.1 )
        
        let n2:Double = 10.15
        XCTAssertEqual( n2.roundWith(0.1), 10.2 )
        XCTAssertEqual( n2.roundWith(0.05), 10.15 )
    }
}
