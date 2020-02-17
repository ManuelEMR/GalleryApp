//
//  UIView+CornerRadius.swift
//  Gallery
//
//  Created by Manuel Munoz on 15/02/2020.
//  Copyright © 2020 Manuel Munoz. All rights reserved.
//

import UIKit

extension UIView {
    
    func roundCornersPath(corners: UIRectCorner, radius: CGFloat) -> UIBezierPath {
        return UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    }
    
    @discardableResult
    func roundCorners(corners: UIRectCorner, radius: CGFloat) -> CAShapeLayer {
        let path = roundCornersPath(corners: corners, radius: radius)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
        return mask
    }
}
