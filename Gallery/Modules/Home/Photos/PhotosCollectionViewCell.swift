//
//  PhotosCollectionViewCell.swift
//  Gallery
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var image: UIImageView!
    
    func configure(with photo: Photo) {
        image.load(photo.thumbnailUrl)
        image.hero.id = photo.title + String(photo.id)
    }
}
