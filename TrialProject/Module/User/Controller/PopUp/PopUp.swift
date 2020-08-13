//
//  PopUp.swift
//  TrialProject
//
//  Created by Mustafa on 8/8/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import UIKit

class PopUp: BaseController {
    
    //MARK:- Properties
    var onBtnViewDetails : ((Bool)->Void)?
    var onBtnViewMap : ((Bool)->Void)?
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK:- IBActions ( PopUp Buttons )
    @IBAction func dotBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //    MARK:- Detail Button
    @IBAction func viewDetailBtnPressed(_ sender: UIButton) {
        super.pushToDetailsOneTime()
        self.dismiss(animated: true, completion: {
            self.onBtnViewDetails?(true)
        })
    }
    
    //    MARK:- Map Button
    @IBAction func viewOnMapBtnPressed(_ sender: UIButton) {
        super.pushToMap()
        self.dismiss(animated: true) {
            self.onBtnViewMap?(true)
        }
        
    }
    
}
