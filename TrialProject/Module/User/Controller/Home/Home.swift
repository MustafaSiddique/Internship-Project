//
//  Home.swift
//  TrialProject
//
//  Created by Mustafa on 8/8/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import UIKit

class Home: BaseController  {
    
    //    MARK:- Properties
    var repairService: RepairServiceModel?
    
    // MARK:- IBOutlets
    @IBOutlet weak var homeTableView: UITableView!
    //    @IBOutlet weak var sbSearchBar: UISearchBar!
    
    //    MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // JSON PARSING DONE HERE....
        self.getRepairService()
        
        
        // MARK:- Register Xib Cells
        homeTableView.register(HomeUpcomingTVC.nib(), forCellReuseIdentifier: HomeUpcomingTVC.identifier)
        homeTableView.register(HomeMaintenanceTVC.nib(), forCellReuseIdentifier: HomeMaintenanceTVC.identifier)
        
    }
    
    
    // MARK:- IBAction ( Filter Button )
    @IBAction func filterBtnPressed(_ sender: UIButton) {
        super.presentFilter()
    }
    @IBAction func notificationBtnPressed(_ sender: UIButton) {
        super.presentNotificationPopUp()
    }
}


// MARK:- Table View Delegates and Datasource
extension Home: UITableViewDelegate,UITableViewDataSource{
    
    
    // MARK:- Sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    // MARK:- Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else{
            return self.repairService?.data?.vehicleRepairServices?.count ?? 0
        }
    }
    
    
    // MARK:- Cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell_1 = tableView.dequeueReusableCell(withIdentifier: "HomeUpcomingTVC", for: indexPath) as! HomeUpcomingTVC
            return cell_1
        }else {
            let cell_2 = tableView.dequeueReusableCell(withIdentifier: "HomeMaintenanceTVC", for: indexPath) as! HomeMaintenanceTVC
            cell_2.delegate = self
            guard let data = self.repairService?.data?.vehicleRepairServices?[indexPath.row] else {return UITableViewCell()}
            cell_2.setData(data: data)
            return cell_2
        }
    }
    
    
    // MARK:- Cell Height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    // MARK:- Header In Section
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = TitleView.instanceFromNib() as! TitleView
        switch section {
            case 0:
                header.titleLbl.text = "Upcoming"
            default:
                header.titleLbl.text = "Repair & Service History"
        }
        return header
    }
    
    
    // MARK:- Height For Header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
}

extension Home:HomeMaintenanceTVCDelegate{
    
    func didTapButton() {
        super.presentPopUp()
    }
    
    
}


//MAKR:- API HIT, FETCHING DATA
extension Home{
    func getRepairService(){
        let urlString = "https://api.blueeclipse.co/api/v1/bluCare/vehicles/5f2b9008183fca4de4cbd918/repairService"
        let token = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVmMmI4ZDAxZDI0ODQyMThlMDM0OTQwYSIsImlhdCI6MTU5NjY4OTk4NCwiZXhwIjoxNTk3MzgxMTg0fQ.xq-MAcIkun4KGAtxobPknhi4easuOJA2AqtN1ew-BGU"
        guard let url = URL(string: urlString) else {return}
        let request = NSMutableURLRequest(url: url)
        request.setValue(token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            guard let data = data else { print(error!); return }
            do {
                let result = try JSONDecoder().decode(RepairServiceModel.self, from: data)
                self.repairService = result
                DispatchQueue.main.async {
                    self.homeTableView.reloadData()
                }
                print(result)
                
            } catch {
                print(error)
            }
        }
        dataTask.resume()
    }
}


