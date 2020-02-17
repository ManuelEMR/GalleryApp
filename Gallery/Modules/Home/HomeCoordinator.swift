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
        photosVC.delegate = self
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
        coordinator.start(album: album)
        coordinator.delegate = self
        UIApplication.topViewController()?.navigationController?    .pushViewController(coordinator.rootViewController, animated: true)
        
        childCoordinators[String(describing: coordinator)] = coordinator
    }
}

extension HomeCoordinator: PhotosViewControllerDelegate {
    func onPhotoClicked(photo: Photo) {
        let photoVC = PhotoDetailViewController.instantiate(storyboardName: Storyboards.photoDetail)
        photoVC.viewModel = container.resolve(PhotoDetailViewModel.self, argument: photo)
        
        UIApplication.topViewController()?.navigationController?.pushViewController(photoVC, animated: true)
    }
}
