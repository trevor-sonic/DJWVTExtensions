//
//  UrlExt.swift
//  Stage2
//
//  Created by dejaWorks on 22/06/2019.
//  Copyright © 2019 dejaWorks. All rights reserved.
//

import Foundation


public extension URL {
    var typeIdentifier: String? {
        return (try? resourceValues(forKeys: [.typeIdentifierKey]))?.typeIdentifier
    }
    var localizedName: String? {
        return (try? resourceValues(forKeys: [.localizedNameKey]))?.localizedName
    }
}
