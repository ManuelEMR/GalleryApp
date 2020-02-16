//
//  Photo.swift
//  Gallery
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import Foundation
import Data

struct Photo {
    let id: Int
    let albumId: Int?
    let title: String
    let url: String
    let thumbnailUrl: String
    
    init(photoModel: PhotoModel) {
        id = photoModel.id
        albumId = photoModel.albumId
        title = photoModel.title
        url = photoModel.url
        thumbnailUrl = photoModel.thumbnailUrl
    }
}
