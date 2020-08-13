//
//  UIView+Extensions.swift
//  TrialProject
//
//  Created by Mustafa on 8/8/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import Foundation
import UIKit
extension UIView{
    
    //MARK:- Border Width
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    //MARK:- Border Color
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    //MARK:- Corner Radius
    @IBInspectable var cornerRadius: CGFloat{
        get{
            return layer.cornerRadius
        }set{
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
}

//MARK:- Place Holder Colour
extension UITextField{
      @IBInspectable var placeHolderColor: UIColor? {
           get {
               return self.placeHolderColor
           }
           set {
               self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
           }
       }
   }
