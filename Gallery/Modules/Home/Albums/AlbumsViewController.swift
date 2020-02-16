//
//  AlbumsViewController.swift
//  Gallery
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import UIKit
import Bond

class AlbumsViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    private let gridDelegate = GridCollectionViewDelegate(spacing: 0) //swiftlint:disable:this weak_delegate
    
    var viewModel: AlbumsViewModel! //swiftlint:disable:this implicitly_unwrapped_optional
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupBindings()
    }
    
    private func setupViews() {
        
        navigationItem.title = "Albums"
        
        collectionView.dataSource = self
        collectionView.delegate = gridDelegate
        let spacing = gridDelegate.spacing
        collectionView.contentInset = UIEdgeInsets(top: spacing * 2, left: 0, bottom: 0, right: 0)
    }
    
    private func setupBindings() {
        viewModel.albums.bind(to: self) { vc, _ in
            vc.collectionView.reloadData()
        }
    }
}

extension AlbumsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.albums.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableBy(cell: AlbumCollectionViewCell.self, indexPath: indexPath) else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: viewModel.albums.value[indexPath.item])
        return cell
    }
}
