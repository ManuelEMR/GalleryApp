//
//  AlbumsPhotoCoordinator.swift
//  Gallery
//
//  Created by Manuel Munoz on 16/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import UIKit

protocol AlbumsPhotoCoordinatorDelegate: AnyObject {
    func willDismissCoordinator(_ coordinator: AlbumsPhotoCoordinator)
}

class AlbumsPhotoCoordinator: Coordinator {
    
    var childCoordinators: [String: Coordinator] = [:]
    weak var delegate: AlbumsPhotoCoordinatorDelegate?
    
    lazy var rootViewController: AlbumPhotosViewController = {
        let vc = AlbumPhotosViewController.instantiate(storyboardName: Storyboards.album)
        return vc
    }()
    
    func start(albumId: Int) {
        rootViewController.viewModel = container.resolve(AlbumPhotosViewModel.self, argument: albumId)
    }
}
