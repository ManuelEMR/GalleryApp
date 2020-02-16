//
//  ImageView+Kingfisher.swift
//  Gallery
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func load(_ urlString: String) {
        self.kf.setImage(with: URL(string: urlString))
    }
}
