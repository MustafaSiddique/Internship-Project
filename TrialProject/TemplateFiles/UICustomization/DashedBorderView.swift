//
//  DashedBorderView.swift
//  TrialProject
//
//  Created by Mustafa on 8/8/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import Foundation
import UIKit
class DashedBorderView: UIView {
override func layoutSubviews() {
    
    super.layoutSubviews()
    let yourViewBorder = CAShapeLayer()
    yourViewBorder.strokeColor = UIColor(red:187/255, green:187/255, blue:190/255, alpha:1.0).cgColor
    yourViewBorder.lineDashPattern = [4, 4]
    yourViewBorder.frame = self.bounds
    yourViewBorder.fillColor = nil
    yourViewBorder.cornerRadius = 6
    yourViewBorder.path = UIBezierPath(rect: self.bounds).cgPath
    self.layer.addSublayer(yourViewBorder)
}
    
}
