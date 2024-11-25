//
//  UIViewExtention.swift
//  MovieTrending
//
//  Created by BJIT on 25/11/24.
//

import UIKit

extension UIView{
    func round(_ radius: CGFloat = 10){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }

    func addBorder(color: UIColor, width: CGFloat){
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}
