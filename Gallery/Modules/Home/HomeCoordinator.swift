//
//  HomeCoordinator.swift
//  Gallery
//
//  Created by Manuel Munoz on 16/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    var childCoordinators: [String: Coordinator] = [:]
    
    lazy var initialViewController: TabBarViewController = {
        TabBarViewController.instantiate(storyboardName: Storyboards.main)
    }()
    
    func start() {
        let albumsVC = AlbumsViewController.instantiate(storyboardName: Storyboards.main)
        albumsVC.viewModel = container.resolve(AlbumsViewModel.self)
        albumsVC.delegate = self
        let albumsNVC = UINavigationController(rootViewController: albumsVC)
        albumsNVC.tabBarItem = UITabBarItem(title: "Albums", image: nil, selectedImage: nil)
        
        let photosVC = PhotosViewController.instantiate(storyboardName: Storyboards.main)
        photosVC.viewModel = container.resolve(PhotosViewModel.self)
        let photosNVC = UINavigationController(rootViewController: photosVC)
        photosNVC.tabBarItem = UITabBarItem(title: "Photos", image: nil, selectedImage: nil)
        
        initialViewController.viewControllers = [albumsNVC, photosNVC]
    }
}

extension HomeCoordinator: AlbumsPhotoCoordinatorDelegate {
    func willDismissCoordinator(_ coordinator: AlbumsPhotoCoordinator) {
        let name = String(describing: coordinator)
        childCoordinators.removeValue(forKey: name)
    }
}

extension HomeCoordinator: AlbumsViewControllerDelegate {
    func onAlbumClicked(album: Album) {
        let coordinator = AlbumsPhotoCoordinator()
        coordinator.start(albumId: album.id)
        coordinator.delegate = self
        UIApplication.topViewController()?.navigationController?    .pushViewController(coordinator.rootViewController, animated: true)
        
        childCoordinators[String(describing: coordinator)] = coordinator
    }
}
