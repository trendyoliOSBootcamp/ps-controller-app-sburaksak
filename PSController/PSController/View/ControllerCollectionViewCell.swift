//
//  ControllerCollectionViewCell.swift
//  PSController
//
//  Created by Burak Sak on 2.05.2021.
//

import UIKit

final class ControllerCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var imageView: UIImageView!
    
    func configure(image: UIImage?) {
        imageView.image = image
    }
}
