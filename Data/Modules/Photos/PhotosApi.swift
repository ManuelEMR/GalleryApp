//
//  PhotosApi.swift
//  Data
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import Foundation
import Alamofire

public enum PhotosApi: BaseApi, URLRequestConvertible {
    case getPhotos
    
    public var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")! //swiftlint:disable:this force_unwrapping
    }
    
    public var method: HTTPMethod {
        switch self {
        case .getPhotos:
            return .get
        }
    }
    
    public var path: String {
        switch self {
        case .getPhotos:
            return "/photos"
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        return request
    }
}
