//
//  UICollectionReusableViewExtensions.swift
//  PSController
//
//  Created by Burak Sak on 8.05.2021.
//

import UIKit

public extension UICollectionReusableView {
    class func getNib(for bundle: Bundle) -> UINib {
        return UINib(nibName: className, bundle: bundle)
    }
    
    class var identifier: String {
        return className
    }
}
