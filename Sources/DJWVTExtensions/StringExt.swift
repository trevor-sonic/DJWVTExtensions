//
//  StringExt.swift
//  Stage2
//
//  Created by dejaWorks on 06/03/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//

import Foundation


// MARK: - String to Date convertor
public extension String {
    func toDate()->Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +0000"
        let date = dateFormatter.date(from: self)
        return date!
    }
}
