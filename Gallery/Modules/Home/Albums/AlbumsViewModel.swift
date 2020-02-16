//
//  AlbumsViewModel.swift
//  Gallery
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import Foundation
import ReactiveKit
import Data

class AlbumsViewModel {
    
    var albums: AnyProperty<[Album]> {
        _albums.readOnlyView
    }
    
    private let albumsRepository: AlbumsRepository
    private let disposable = DisposeBag()
    private let _albums = Property<[Album]>([])
    
    init(albumsRepository: AlbumsRepository) {
        self.albumsRepository = albumsRepository
        
        loadAlbums()
    }
    
    private func loadAlbums() {
        albumsRepository.getAlbums()
            .map { $0.prefix(upTo: 30) }
            .flatMapLatest { albumModels in
                Signal.init(sequence: albumModels)
            }
            .flatMapConcat { albumModel in
                return self.albumsRepository.getPhotosOf(albumId: albumModel.id)
                    .flatMapError { _ in Signal(just: []) }
                    .map { Album(albumModel: albumModel, photos: $0) }
            }
            .collect()
            .subscribe(on: ExecutionContext.global())
            .receive(on: ExecutionContext.main)
            .observeNext { self._albums.value = $0 }
            .dispose(in: disposable)
    }
}
