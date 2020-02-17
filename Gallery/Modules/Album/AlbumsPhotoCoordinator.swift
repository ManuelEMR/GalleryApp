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
    
    func start(album: Album) {
        rootViewController.navigationItem.title = album.title
        rootViewController.viewModel = container.resolve(AlbumPhotosViewModel.self, argument: album.id)
        rootViewController.delegate = self
    }
}

extension AlbumsPhotoCoordinator: AlbumPhotosViewControllerDelegate {
    func onPhotoClicked(photo: Photo) {
        let photoVC = PhotoDetailViewController.instantiate(storyboardName: Storyboards.photoDetail)
        photoVC.viewModel = container.resolve(PhotoDetailViewModel.self, argument: photo)
        
        UIApplication.topViewController()?.navigationController?.pushViewController(photoVC, animated: true)
    }
}
