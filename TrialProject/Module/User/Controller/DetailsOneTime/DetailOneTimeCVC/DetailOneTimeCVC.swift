//
//  DetailOneTimeCVC.swift
//  TrialProject
//
//  Created by Mustafa on 8/9/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import UIKit

class DetailOneTimeCVC: UICollectionViewCell {
    //var imageArrayForCollectionView = [UIImage]()
    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var btnDelete: UIButton!
    
    func setData(data:UIImage){
        self.cellImage.image = data
    }
    
}

