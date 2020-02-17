//
//  AlbumsRowCollectionViewCell.swift
//  Gallery
//
//  Created by Manuel Munoz on 17/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import UIKit

class AlbumRowCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var coverImage: UIImageView!
    @IBOutlet var albumTitle: UILabel!
    
    func configure(with album: Album) {
        if let firstPhoto = album.photos.first {
            coverImage.load(firstPhoto.thumbnailUrl)
            coverImage.hero.id = firstPhoto.title + String(firstPhoto.id)
        }
        albumTitle.text = album.title
    }
}
