//
//  ApiProvider.swift
//  Data
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import Foundation
import Alamofire
import ReactiveKit

public typealias Api = BaseApi & URLRequestConvertible
public class ApiProvider<T: Api> {
    
    public init() {
        AF.session.configuration.timeoutIntervalForRequest = 4
        AF.session.configuration.timeoutIntervalForResource = 4
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
                        debugPrint(response)
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
