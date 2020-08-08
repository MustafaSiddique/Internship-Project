//
//  HomeUpcomingTVC.swift
//  TrialProject
//
//  Created by Mustafa on 8/7/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import UIKit

class HomeUpcomingTVC: UITableViewCell {
    
 //MARK:-Ptoperties
    
    static let identifier = "HomeUpcomingTVC"

 // MARK:- IBOutlets
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib()->UINib{
        return UINib(nibName: "HomeUpcomingTVC", bundle: nil)
    }
    
}
