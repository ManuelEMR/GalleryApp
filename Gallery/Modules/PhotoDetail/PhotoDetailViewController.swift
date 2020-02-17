//
//  PhotoDetailViewController.swift
//  Gallery
//
//  Created by Manuel Munoz on 16/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import UIKit
import Bond

class PhotoDetailViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var viewModel: PhotoDetailViewModel! //swiftlint:disable:this implicitly_unwrapped_optional
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        setupBindings()
    }
    
    private func setupBindings() {
        viewModel.photo.bind(to: self) { vc, photo in
            vc.titleLabel.text = photo.title
            vc.imageView.load(photo.url)
        }
    }
}
