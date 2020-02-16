//
//  BaseRepository.swift
//  Data
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import Foundation

public class BaseRepository<T: Api> {
    let api: ApiProvider<T>
    
    required public init(api: ApiProvider<T>) {
        self.api = api
    }
}

public enum DataError: Error {
    case unknown(msg: String?)
}
