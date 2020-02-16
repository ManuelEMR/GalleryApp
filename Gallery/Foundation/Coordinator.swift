//
//  Coordinator.swift
//  Gallery
//
//  Created by Manuel Munoz on 16/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import Foundation

protocol Coordinator {
    // Key should be the coordinators type name
    var childCoordinators: [String: Coordinator] { get set }
}
