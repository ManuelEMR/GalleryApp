//
//  BaseApi.swift
//  Data
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import Foundation
import Alamofire

public protocol BaseApi {
    var baseURL: URL { get }
    
    var method: HTTPMethod { get }
    
    var path: String { get }
}
