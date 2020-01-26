//
//  ArrayExt.swift
//  Stage2
//
//  Created by dejaWorks on 22/09/2018.
//  Copyright © 2018 dejaWorks. All rights reserved.
//

import Foundation

public extension Array where Element: Hashable {
    func removeDuplicates() -> [Element] {
        var seen = Set<Element>()
        return filter{ seen.insert($0).inserted }
    }
}
