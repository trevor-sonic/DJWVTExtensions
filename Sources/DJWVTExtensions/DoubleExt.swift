//
//  DoubleExt.swift
//  Stage2
//
//  Created by dejaWorks on 12/12/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//

import Foundation

public extension Double{
    /// resolution can be like 0.25,  0.0001 etc.
    func roundWith(_ resolution:Double)->Double{
        let multiplier:Double = 1 / resolution
        let roundVal = (self * multiplier).rounded(.toNearestOrEven) / multiplier
        return roundVal
    }
}
public extension Comparable {
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}
public extension Strideable where Stride: SignedInteger {
    func clamped(to limits: CountableClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}


///Returns main and decimal part of a decimal number
public extension Double{
    func integerPart()->String{
        let result = floor(abs(self)).description.dropLast(2).description
        let plusMinus = self < 0 ? "-" : ""
        return  plusMinus + result
    }
    func fractionalPart(_ withDecimalQty:Int = 2)->String{
        let valDecimal = self.truncatingRemainder(dividingBy: 1)
        let formatted = String(format: "%.\(withDecimalQty)f", valDecimal)
        let dropQuantity = self < 0 ? 3:2
        return formatted.dropFirst(dropQuantity).description
    }
}
///Returns rounded in step numbers e.g. step is 4; 9 -> 12, 15 -> 16
public extension Double{
    func roundStepUp(by step:Double)->Double{
        var result = self
        let remain = self.truncatingRemainder(dividingBy: step)
        
        
        if remain != 0{
            result = result.advanced(by: -remain)
            result = result.advanced(by: step)
        }
        return result
    }
}
public extension Double {
    // add limited decimal part if necessary
    func formated(decimalQty:Int = 2)->String{
        
        let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2
        return formatter.string(from: self as NSNumber)!
    }
    func formated(fixedDecimalQty:Int = 2, flat:Bool = false)->String{
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        // print(numberFormatter.currencySymbol)  // give $ or £
        
        formatter.minimumFractionDigits  = fixedDecimalQty
        formatter.maximumFractionDigits  = fixedDecimalQty
        
        
        
        formatter.locale = Locale(identifier: Locale.current.identifier)
        
        if flat{ formatter.numberStyle = .none }
        
        let formatedNumberStr = formatter.string(from: self as NSNumber)
        
        return formatedNumberStr!
    }
}
