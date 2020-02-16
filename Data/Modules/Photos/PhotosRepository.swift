//
//  PhotosRepository.swift
//  Data
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import Foundation
import ReactiveKit

public class PhotosRepository: BaseRepository<PhotosApi> {
    
    public func getPhotos() -> Signal<[PhotoModel], DataError> {
        api.request(endpoint: .getPhotos)
    }
}
