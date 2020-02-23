//
//  StringExt.swift
//  Stage2
//
//  Created by dejaWorks on 06/03/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//

import UIKit

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
        let nsString = (self as NSString)
        
        let range: NSRange = NSMakeRange(index, 1)
        let prefix = nsString.substring(to: range.location)
        
        let size: CGSize = prefix.size(withAttributes: [NSAttributedString.Key.font: usedFont])
        let pos = CGPoint(x: size.width , y: 0)

        return pos.x
    }
}

/// substring helper
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
