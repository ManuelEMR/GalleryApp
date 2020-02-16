//
//  Photo.swift
//  Data
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import Foundation

public struct PhotoModel: Decodable {
    public let albumId: Int
    public let id: Int
    public let title: String
    public let url: String
    public let thumbnailUrl: String
}
