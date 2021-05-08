//
//  NSObjectExtensions.swift
//  PSController
//
//  Created by Burak Sak on 8.05.2021.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}

