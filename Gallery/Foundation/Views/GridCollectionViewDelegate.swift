//
//  GridCollectionViewDelegate.swift
//  Gallery
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import UIKit

class GridCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    
    typealias OnCellSelected = (IndexPath) -> Void
    
    let numberOfRows: CGFloat
    let spacing: CGFloat
    let aspectRatio: CGFloat
    private var onCellSelected: OnCellSelected?
    
    init(numberOfRows: CGFloat = 2, spacing: CGFloat = 5, aspectRatio: CGFloat = 1) {
        self.numberOfRows = numberOfRows
        self.spacing = spacing
        self.aspectRatio = aspectRatio
    }
    
    func setOnCellSelected(_ onCellSelected: @escaping OnCellSelected) {
        self.onCellSelected = onCellSelected
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        onCellSelected?(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth = (collectionView.frame.width / numberOfRows) - (spacing * 3)
        return CGSize(width: cellWidth, height: cellWidth / CGFloat(aspectRatio))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing * 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: spacing * 2, bottom: 0, right: spacing * 2)
    }
}
