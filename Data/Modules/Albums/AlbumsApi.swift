//
//  AlbumsApi.swift
//  Data
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import Foundation
import Alamofire

public enum AlbumsApi: BaseApi, URLRequestConvertible {
    case getAlbums
    case albumPhotos(albumId: Int)
    
    public var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")! //swiftlint:disable:this force_unwrapping
    }
    
    public var method: HTTPMethod {
        switch self {
        case .getAlbums:
            return .get
        case .albumPhotos:
            return .get
        }
    }
    
    public var path: String {
        switch self {
        case .getAlbums:
            return "/albums"
        case .albumPhotos(let albumId):
            return "/albums/\(albumId)/photos"
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        return request
    }
}
