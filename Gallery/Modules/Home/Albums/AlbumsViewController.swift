//
//  AlbumsViewController.swift
//  Gallery
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import UIKit
import Bond
import Hero

protocol AlbumsViewControllerDelegate: AnyObject {
    func onAlbumClicked(album: Album)
}

enum AlbumPresentation {
    case row
    case grid
}

class AlbumsViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    var viewModel: AlbumsViewModel! //swiftlint:disable:this implicitly_unwrapped_optional
    weak var delegate: AlbumsViewControllerDelegate?
    
    private let gridDelegate = GridCollectionViewDelegate(spacing: 0) //swiftlint:disable:this weak_delegate
    private let rowDelegate = GridCollectionViewDelegate(numberOfRows: 1, spacing: 0, aspectRatio: 4) //swiftlint:disable:this weak_delegate
    private var albumPresentation = AlbumPresentation.grid
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupBindings()
    }
    
    private func setupViews() {
        self.hero.isEnabled = true
        navigationItem.title = "Albums"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_list"), style: .plain, target: self, action: #selector(togglePresentation))
        
        collectionView.dataSource = self
        collectionView.delegate = gridDelegate
        let spacing = gridDelegate.spacing
        collectionView.contentInset = UIEdgeInsets(top: spacing * 2, left: 0, bottom: 0, right: 0)
        gridDelegate.setOnCellSelected(onCellSelected)
        rowDelegate.setOnCellSelected(onCellSelected)
    }
    
    private func setupBindings() {
        viewModel.albums.bind(to: self) { vc, _ in
            vc.collectionView.reloadData()
        }
    }
    
    @objc private func togglePresentation() {
        switch albumPresentation {
        case .row:
            swapToGrid()
        case .grid:
            swapToList()
        }
    }
    
    private func swapToList() {
        albumPresentation = .row
        navigationItem.rightBarButtonItem?.image = UIImage(named: "ic_grid")
        collectionView.delegate = rowDelegate
        collectionView.reloadData()
    }
    
    private func swapToGrid() {
        albumPresentation = .grid
        navigationItem.rightBarButtonItem?.image = UIImage(named: "ic_list")
        collectionView.delegate = gridDelegate
        collectionView.reloadData()
    }
    
    private func onCellSelected(indexPath: IndexPath) {
        let album = self.viewModel.albums.value[indexPath.item]
        self.delegate?.onAlbumClicked(album: album)
    }
}

extension AlbumsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.albums.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch albumPresentation {
        case .grid:
            guard let cell = collectionView.dequeueReusableBy(cell: AlbumCollectionViewCell.self, indexPath: indexPath) else {
                return UICollectionViewCell()
            }
            
            cell.configure(with: viewModel.albums.value[indexPath.item])
            return cell
        case .row:
            guard let cell = collectionView.dequeueReusableBy(cell: AlbumRowCollectionViewCell.self, indexPath: indexPath) else {
                return UICollectionViewCell()
            }
            
            cell.configure(with: viewModel.albums.value[indexPath.item])
            return cell
        }
    }
}
