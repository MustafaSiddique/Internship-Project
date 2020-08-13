//
//  HomeMaintenanceTVC.swift
//  TrialProject
//
//  Created by Mustafa on 8/8/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import UIKit

protocol HomeMaintenanceTVCDelegate {
    func didTapButton()
}

class HomeMaintenanceTVC: UITableViewCell {
    
    //MARK:-Ptoperties
    static let identifier = "HomeMaintenanceTVC"
    var delegate:HomeMaintenanceTVCDelegate?
    
    // MARK:- IBOutlets ....
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageTitleLeft: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var imagePriceLeft: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
    //    MARK:- Awake From Nib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    // MARK:- IBAction ( Three Dots Button In Cell)
    @IBAction func dotBtnPressed(_ sender: UIButton) {
        delegate?.didTapButton()
    }
    
    
    // MARK:- Xib Cell
    static func nib()->UINib{
        return UINib(nibName: "HomeMaintenanceTVC", bundle: nil)
    }
    
}

//MARK:- Set API data into Table view cell
extension HomeMaintenanceTVC{
    
    func setData(data: VehicleRepairServices){
        titleLbl.text = data.type
        priceLbl.text = "\(data.price ?? 0.0)"
        addressLbl.text = data.address?.address ?? ""
    }
    
    
}
