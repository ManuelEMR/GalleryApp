//
//  AppModule.swift
//  Gallery
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import Foundation
import Swinject

func setupModules(_ modules: [SwinjectModule], into container: Container) {
    modules.forEach { $0.setup(container) }
}

protocol SwinjectModule {
    func setup(_ container: Container)
}

// Top level getter to facilitate access to AppDelegate Container
var container: Container {
    (UIApplication.shared.delegate as? AppDelegate)!.container
}
