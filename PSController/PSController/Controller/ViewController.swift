//
//  ViewController.swift
//  PSController
//
//  Created by Burak Sak on 1.05.2021.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var basketButton: UIButton!
    @IBOutlet private weak var controllerTabView: UIView!
    @IBOutlet private weak var devicesTabView: UIView!
    @IBOutlet private weak var mouseTabView: UIView!
    
    private var cellWidth: CGFloat = 0
    private let products: [Product] = [.init(image: UIImage(named: "whitePSController")),
                                       .init(image: UIImage(named: "blackPSController")),
                                       .init(image: UIImage(named: "whitePSController")),
                                       .init(image: UIImage(named: "whitePSController")),
                                       .init(image: UIImage(named: "whitePSController")),
                                       .init(image: UIImage(named: "whitePSController")),
                                       .init(image: UIImage(named: "whitePSController")),
                                       .init(image: UIImage(named: "whitePSController"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(.init(UINib(nibName: "ControllerCollectionViewCell",
                                            bundle: .main)),
                                forCellWithReuseIdentifier: "psControllerIdentifier")
    }
    
    @IBAction private func basketButtonTapped() {
        print("basket button tapped")
    }
}


extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "psControllerIdentifier", for: indexPath) as? ControllerCollectionViewCell else {
            fatalError()
        }
        let product = products[indexPath.item]
        cell.configure(image: product.image)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        cellWidth = collectionView.frame.width / 1.3982
        return .init(width: cellWidth, height: cellWidth / 0.7938)
    }
}

extension ViewController: UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        let visibleWidth = layout.minimumInteritemSpacing + cellWidth
        let indexOfItemToSnap = round(targetContentOffset.pointee.x / visibleWidth)
        
        targetContentOffset.pointee = CGPoint(x: indexOfItemToSnap * visibleWidth, y: 0)
    }
}
