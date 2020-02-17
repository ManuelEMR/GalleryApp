//
//  PhotosViewController.swift
//  Gallery
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import UIKit

protocol PhotosViewControllerDelegate: AnyObject {
    func onPhotoClicked(photo: Photo)
}

class PhotosViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var viewModel: PhotosViewModel! //swiftlint:disable:this implicitly_unwrapped_optional
    weak var delegate: PhotosViewControllerDelegate?
    
    private let gridDelegate = GridCollectionViewDelegate(numberOfRows: 3, spacing: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupBindings()
    }
    
    private func setupViews() {
        
        navigationItem.title = "Photos"
        
        collectionView.dataSource = self
        collectionView.delegate = gridDelegate
        let spacing = gridDelegate.spacing
        collectionView.contentInset = UIEdgeInsets(top: spacing * 2, left: 0, bottom: 0, right: 0)
        gridDelegate.setOnCellSelected { (indexPath) in
            let photo = self.viewModel.photos.value[indexPath.item]
            self.delegate?.onPhotoClicked(photo: photo)
        }
    }
    
    private func setupBindings() {
        viewModel.photos.bind(to: self) { vc, _ in
            vc.collectionView.reloadData()
        }
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.photos.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableBy(cell: PhotosCollectionViewCell.self, indexPath: indexPath) else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: viewModel.photos.value[indexPath.item])
        return cell
    }
}
