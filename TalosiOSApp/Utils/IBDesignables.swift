//
//  IBDesignables.swift
//  TalosiOSApp
//
//  Created by Sebastian Giraldo  on 11/16/20.
//

import Foundation
import UIKit

@IBDesignable open class TalosView : UIView{}
@IBDesignable open class TalosImageView : UIImageView {}

extension UIView {
    
    func roundedCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let b = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.width, height: bounds.height)
        
        let path = UIBezierPath(roundedRect: b, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}

extension TalosView{
    @IBInspectable var cornerRadius: CGFloat{
        get{
            return layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat{
        get{
            return layer.borderWidth
        }
        set{
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderColor: UIColor{
        get{
            return UIColor(cgColor: layer.borderColor!)
        }
        set{
            layer.borderColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor {
        get {
            return UIColor(cgColor: layer.shadowColor!)
        }
        set {
            layer.masksToBounds = false
            layer.shadowColor = newValue.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var topLeftRoundCorners: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let corner: UIRectCorner = [.topLeft]
            self.roundedCorners(corner, radius: newValue)
        }
    }
    @IBInspectable var topRightRoundCorners: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let corner: UIRectCorner = [.topRight]
            self.roundedCorners(corner, radius: newValue)
        }
    }
    @IBInspectable var bottomLeftRoundCorners: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let corner: UIRectCorner = [.bottomLeft]
            self.roundedCorners(corner, radius: newValue)
        }
    }
    @IBInspectable var bottomRightRoundCorners: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let corner: UIRectCorner = [.bottomRight]
            self.roundedCorners(corner, radius: newValue)
        }
    }
    @IBInspectable var topRoundCorners: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let corner: UIRectCorner = [.topRight, .topLeft]
            self.roundedCorners(corner, radius: newValue)
        }
    }
    @IBInspectable var bottomRoundCorners: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            let corner: UIRectCorner = [.bottomRight, .bottomLeft]
            self.roundedCorners(corner, radius: newValue)
        }
    }
}

extension TalosImageView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat{
        get{
            return layer.borderWidth
        }
        set{
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderColor: UIColor{
        get{
            return UIColor(cgColor: layer.borderColor!)
        }
        set{
            layer.borderColor = newValue.cgColor
        }
    }
}
