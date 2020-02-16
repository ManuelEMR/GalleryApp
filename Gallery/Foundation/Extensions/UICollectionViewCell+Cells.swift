//
//  UICollectionViewCell+Cells.swift
//  Gallery
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func registerCell(cell type: UICollectionViewCell.Type, bundle: Bundle? = nil) {
        let className = String(describing: type)
        register(type, forCellWithReuseIdentifier: className)
    }
    
    func dequeueReusableBy<T>(cell type: T.Type, indexPath: IndexPath) -> T? {
        let identifier = String(describing: type)
        return dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? T
    }
    
    func register(view type: UICollectionReusableView.Type, bundle: Bundle? = nil, kind: String) {
        let className = String(describing: type)
        register(type, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
    }
    
    func dequeueReusableSupplementaryBy<T: UICollectionReusableView>(
        view type: T.Type,
        indexPath: IndexPath,
        kind: String) -> T? {
        let identifier = String(describing: type)
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: identifier, for: indexPath) as? T
    }
}
