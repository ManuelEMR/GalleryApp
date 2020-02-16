//
//  AppCoordinator.swift
//  Gallery
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import UIKit

class AppCoordinator {
    
    lazy var initialViewController: TabBarViewController = {
        TabBarViewController.instantiate(storyboardName: Storyboards.main)
    }()
    
    func start() {
        let albumsVC = AlbumsViewController.instantiate(storyboardName: Storyboards.main)
        albumsVC.viewModel = container.resolve(AlbumsViewModel.self)
        let albumsNVC = UINavigationController(rootViewController: albumsVC)
        albumsNVC.tabBarItem = UITabBarItem(title: "Albums", image: nil, selectedImage: nil)
        
        let photosNVC = UINavigationController(rootViewController: UIViewController())
        photosNVC.tabBarItem = UITabBarItem(title: "Photos", image: nil, selectedImage: nil)
        
        initialViewController.viewControllers = [albumsNVC, photosNVC]
    }
}
