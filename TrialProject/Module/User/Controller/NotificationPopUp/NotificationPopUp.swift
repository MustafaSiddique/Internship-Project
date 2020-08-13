//
//  NotificationPopUp.swift
//  TrialProject
//
//  Created by Mustafa on 8/14/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import UIKit

class NotificationPopUp: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func okBtnPressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
