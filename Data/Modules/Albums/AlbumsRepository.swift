//
//  AlbumsRepository.swift
//  Data
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import Foundation
import ReactiveKit

public class AlbumsRepository: BaseRepository<AlbumsApi> {
    
    public func getAlbums() -> Signal<[Album], DataError> {
        request(endpoint: .getAlbums)
    }
    
    public func getPhotosOf(albumId: Int) -> Signal<[Photo], DataError> {
        request(endpoint: .albumPhotos(albumId: albumId))
    }
}
