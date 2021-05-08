//
//  UICollectionViewExtensions.swift
//  PSController
//
//  Created by Burak Sak on 8.05.2021.
//

import UIKit

extension UICollectionView {    
    func register(cellType: UICollectionViewCell.Type, bundle: Bundle) {
        register(cellType.getNib(for: bundle), forCellWithReuseIdentifier: cellType.identifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as? T else {
            fatalError()
        }
        
        return cell
    }
}
