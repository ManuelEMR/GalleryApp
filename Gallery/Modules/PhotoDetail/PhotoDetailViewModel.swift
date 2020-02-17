//
//  PhotoDetailViewModel.swift
//  Gallery
//
//  Created by Manuel Munoz on 16/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import Foundation
import ReactiveKit
import Data

class PhotoDetailViewModel {
    
    var photo: AnyProperty<Photo> {
        _photo.readOnlyView
    }
    
    private let _photo: Property<Photo>
    private let albumRepository: AlbumsRepository
    
    init(albumRepository: AlbumsRepository,
         photo: Photo) {
        self.albumRepository = albumRepository
        _photo = Property(photo)
    }
}
