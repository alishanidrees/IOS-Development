//
//  UIView=Extention.swift
//  IOSecondProject
//
//  Created by Ali Shan on 14/11/2023.
//

import Foundation
import UIKit

extension UIView {
    
    func dropShadow( shadowRadius: CGFloat = 4.0, offsetSize: CGSize = CGSize(width: 0, height: 1), shadowOpacity: Float = 0.16, shadowColor: UIColor = .black ) {
        layer.masksToBounds = false
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = offsetSize
        layer.shadowRadius = shadowRadius
      }
//    func dropShadow(scale: Bool = true) {
//        layer.masksToBounds = false
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.6
//        layer.shadowOffset = .zero
//        layer.shadowRadius = 1
//        layer.shouldRasterize = true
//        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
//    }
    
     func setImageBound(){
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.green.cgColor
        layer.cornerRadius = frame.width/2
        clipsToBounds = true
    }
    
     func setViewBackgroundBorder(){
        //imgviewProfile.layer.viewBackground = 1
        layer.masksToBounds = false
       // imgviewProfile.layer.borderColor = UIColor.green.cgColor
        layer.cornerRadius = 11
        clipsToBounds = true
    }
}
