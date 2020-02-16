//
//  Album.swift
//  Gallery
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import Foundation
import Data

struct Album {
    let id: Int
    let title: String
    let photos: [Photo]
    
    init(albumModel: AlbumModel, photos: [PhotoModel]) {
        id = albumModel.id
        title = albumModel.title
        self.photos = photos.map { Photo(photoModel: $0) }
    }
}
