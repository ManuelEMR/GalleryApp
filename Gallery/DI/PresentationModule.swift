//
//  PresentationModule.swift
//  Gallery
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import Foundation
import Swinject
import Data

// swiftlint:disable force_unwrapping identifier_name

class PresentationModule: SwinjectModule {
    func setup(_ container: Container) {
        
        container.register(AlbumsViewModel.self) { r in
            AlbumsViewModel(albumsRepository: r.resolve(AlbumsRepository.self)!)
        }
    }
}