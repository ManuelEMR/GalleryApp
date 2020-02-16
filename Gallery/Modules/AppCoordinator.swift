//
//  AppCoordinator.swift
//  Gallery
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    var initialViewController: UIViewController {
        homeCoordinator.initialViewController
    }
    
    private let homeCoordinator = HomeCoordinator()
    
    func start() {
        homeCoordinator.start()
    }
}
