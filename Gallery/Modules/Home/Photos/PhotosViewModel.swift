//
//  PhotosViewModel.swift
//  Gallery
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import Foundation
import ReactiveKit
import Data

class PhotosViewModel {
    
    var photos: AnyProperty<[Photo]> {
        _photos.readOnlyView
    }
    
    private let photosRepository: PhotosRepository
    private let _photos = Property<[Photo]>([])
    private let disposeBag = DisposeBag()
    
    init(photosRepository: PhotosRepository) {
        self.photosRepository = photosRepository
        
        loadPhotos()
    }
    
    private func loadPhotos() {
        photosRepository.getPhotos()
            .subscribe(on: ExecutionContext.global())
            .receive(on: ExecutionContext.main)
            .map { $0.map { Photo(photoModel: $0) } }
            .observeNext { self._photos.value = $0 }
            .dispose(in: disposeBag)
    }
}
