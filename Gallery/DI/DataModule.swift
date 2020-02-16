//
//  DataModule.swift
//  Gallery
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import Foundation
import Swinject
import Data

class DataModule: SwinjectModule {
    
    func setup(_ container: Container) {
        func resolveApiProvider<T: Api>() -> ApiProvider<T> {
            ApiProvider<T>()
        }
        
        func registerRepository<A: Api, T: BaseRepository<A>>(_ repository: T.Type) {
            container.register(repository) { _ in
                T.init(api: resolveApiProvider())
            }.inObjectScope(.container)
        }
        
        registerRepository(AlbumsRepository.self)
    }
}
