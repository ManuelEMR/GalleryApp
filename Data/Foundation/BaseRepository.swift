//
//  BaseRepository.swift
//  Data
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import Foundation
import Alamofire
import ReactiveKit

public class BaseRepository<T: BaseApi & URLRequestConvertible> {
    let api: T
    
    init(api: T) {
        self.api = api
    }
    
    func request<U: Decodable>(endpoint: T) -> Signal<U, DataError> {
        Signal<U, AFError> { observer in
            let task = AF.request(endpoint)
                .responseDecodable(of: U.self) { response in
                    switch response.result {
                    case .success(let item):
                        observer.receive(item)
                        observer.receive(completion: .finished)
                    case .failure(let err):
                        observer.receive(completion: .failure(err))
                    }
            }
            
            return BlockDisposable {
                task.cancel()
            }
        }
        .subscribe(on: ExecutionContext.global())
        .mapError { .unknown(msg: $0.errorDescription) }
    }
}

public enum DataError: Error {
    case unknown(msg: String?)
}
