//
//  AlbumCollectionViewCell.swift
//  Gallery
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var topLeftImage: UIImageView!
    @IBOutlet var topRightImage: UIImageView!
    @IBOutlet var botLeftImage: UIImageView!
    @IBOutlet var botRightImage: UIImageView!
    
    private lazy var cornerLayer: CAShapeLayer = {
        let mask = CAShapeLayer()
        layer.mask = mask
        return mask
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        cornerLayer.path = roundCornersPath(corners: [.allCorners], radius: 20).cgPath
    }
    
    func configure(with album: Album) {
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.gray.cgColor
        
        var copy = album.photos
        if copy.count < 4 {
            let missingPictures = 4 - copy.count
            copy.append(contentsOf: copy.prefix(upTo: missingPictures))
        }
        
        [topLeftImage, topRightImage, botLeftImage, botRightImage]
            .enumerated().forEach { (arg) in
                let (index, image) = arg
                let photo = copy[index]
                image?.load(photo.thumbnailUrl)
                image?.hero.id = photo.title + String(photo.id)
        }
    }
}
