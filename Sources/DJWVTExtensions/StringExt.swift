//
//  StringExt.swift
//  Stage2
//
//  Created by dejaWorks on 06/03/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//

import UIKit
import Foundation

/// Make first letter uppercased only
public extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}


public extension StringProtocol {
    func index<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.lowerBound
    }
    func endIndex<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.upperBound
    }
    func indices<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Index] {
        var indices: [Index] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...]
                .range(of: string, options: options) {
                    indices.append(range.lowerBound)
                    startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                        index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return indices
    }
    func ranges<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...]
                .range(of: string, options: options) {
                    result.append(range)
                    startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                        index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}


/// Takes the first string between indicators
/// Ex. "This is [abc] example".takeBetween(from: "[", to: "]")  will return "abc"
public extension String {
    func takeBetween(from: String, to: String) -> String? {
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
    

    func takeMultiBetweenBracets()->[String]{
        let query = self //"Hello %test% how do you do %test1%"
        let regex = try! NSRegularExpression(pattern:"\\[(.*?)\\]", options: [])
        var results = [String]()
        
        regex.enumerateMatches(in: query, options: [], range: NSMakeRange(0, query.utf16.count)) { result, flags, stop in
            if let r = result?.range(at: 1), let range = Range(r, in: query) {
                results.append(String(query[range]))
            }
        }
        return results
    }
}



/// Remove double spaces in between words
public extension String {
    func condenseWhitespace() -> String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
}

// MARK: - String to Date convertor
public extension String {
    func toDate()->Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +0000"
        let date = dateFormatter.date(from: self)
        return date!
    }
}

public extension String {
    
    mutating func trim(){
        self =  self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    mutating func fillWithIfItsEmpty(_ fillStr:String){
        if self.count < 1 {
            self =  fillStr
        }
    }
}

// MARK: - UI + String

public extension String {
    /// Returns pixel sizes of text
    func sizeAsPixel(usedFont:UIFont)->CGSize{
        let nsString = (self + "<<=END" as NSString)
        let range: NSRange = nsString.range(of: "<<=END")
        let prefix = nsString.substring(to: range.location)
        let size: CGSize = prefix.size(withAttributes: [NSAttributedString.Key.font: usedFont])
        return size
    }
    /// Returns pixel position of searched text
    func position(of textToFind:String, usedFont:UIFont)->CGFloat{
        let nsString = (self as NSString)
        
        let range: NSRange = nsString.range(of: textToFind)
        let prefix = nsString.substring(to: range.location)
        
        let size: CGSize = prefix.size(withAttributes: [NSAttributedString.Key.font: usedFont])
        let pos = CGPoint(x: size.width , y: 0)
        
        return pos.x
    }
    
    /// Returns pixel position of index
    func position(of index:Int, usedFont:UIFont)->CGFloat{
        let limitedIndex = index > self.count ? self.count : index
        let nsString = (self as NSString)
        
        let range: NSRange = NSMakeRange(limitedIndex, 1)
        let prefix = nsString.substring(to: range.location)
        
        let size: CGSize = prefix.size(withAttributes: [NSAttributedString.Key.font: usedFont])
        let pos = CGPoint(x: size.width , y: 0)
        
        return pos.x
    }
}

/**
 let str = "abcdef"
 str[1 ..< 3] // returns "bc"
 str[5] // returns "f"
 str[80] // returns ""
 str.substring(fromIndex: 3) // returns "def"
 str.substring(toIndex: str.length - 2) // returns "abcd"
 */
public extension String {
    
    var length: Int {
        return count
    }
    
    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }
    
    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
}
