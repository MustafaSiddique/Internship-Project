//
//  TitleView.swift
//  TrialProject
//
//  Created by Mustafa on 8/10/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import UIKit

//    MARK:- Title View In Home Table View
class TitleView: UIView {

    @IBOutlet weak var titleLbl: UILabel!
    
    // MARK:- Xib View
    class func instanceFromNib() -> UIView{
        return UINib(nibName: "TitleView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }

}
