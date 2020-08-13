//
//  BaseNavigationController.swift
//  TrialProject
//
//  Created by Mustafa on 8/8/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import Foundation
import UIKit

class BaseNavigationController: UINavigationController {
    
    // MARK:- NAVIGATION BAR 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = .black
        self.navigationBar.tintColor = .white
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.red]
        self.navigationBar.isTranslucent = false
    }
}
