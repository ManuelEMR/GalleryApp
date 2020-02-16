//
//  AlbumPhotosViewModel.swift
//  Gallery
//
//  Created by Manuel Munoz on 16/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import Foundation
import Data
import ReactiveKit

class AlbumPhotosViewModel {
    
    var photos: AnyProperty<[Photo]> {
        _photos.readOnlyView
    }
    
    private let albumsRepository: AlbumsRepository
    private let _photos = Property<[Photo]>([])
    private let disposeBag = DisposeBag()
    
    private let albumId: Int
    
    init(albumsRepository: AlbumsRepository, albumId: Int) {
        self.albumsRepository = albumsRepository
        self.albumId = albumId
        
        getPhotos()
    }
    
    private func getPhotos() {
        albumsRepository.getPhotosOf(albumId: albumId)
            .map { $0.map { Photo(photoModel: $0) } }
            .subscribe(on: ExecutionContext.global())
            .receive(on: ExecutionContext.main)
            .observeNext { self._photos.value = $0 }
            .dispose(in: disposeBag)
    }
}
