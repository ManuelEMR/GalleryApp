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
    
    public func getAlbums() -> Signal<[AlbumModel], DataError> {
        api.request(endpoint: .getAlbums)
    }
    
    public func getPhotosOf(albumId: Int) -> Signal<[PhotoModel], DataError> {
        api.request(endpoint: .albumPhotos(albumId: albumId))
    }
}
