//
//  BaseController.swift
//  TrialProject
//
//  Created by Mustafa on 8/8/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import Foundation
import UIKit

class BaseController: UIViewController {
    
    // MARK:- VIEW LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBar()
    }
}

extension BaseController{
    
    // MARK:- SET NAVIGATION BAR
    //WHEN FIRST SCREEN IS PUSH IN ROOT VIEW CONROLLER
    func setNavigationBar(){
        guard let navigationControllerCount = self.navigationController?.viewControllers.count else { return  }
        if navigationControllerCount > 0 {
            self.navigationController?.navigationBar.isHidden = true
            self.addBackBarButtonItem()
            return
        }else{
            print("no controller found")
        }
        self.resetNavigationBar()
    }
    
    func resetNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.tintColor = .white
    }
    
}

//    MARK:-   BACK BUTTON ITEM
extension BaseController{
    
    func addBackBarButtonItem(){
        let image = #imageLiteral(resourceName: "Vector-6")
        let backItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.onButtonBack))
        self.navigationItem.leftBarButtonItem = backItem
    }
    
}

extension BaseController{
    @objc func onButtonBack(){
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- APPLICATION  FLOW

extension BaseController{
    
    //    MARK:- Filter VC
    func presentFilter(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "Filter") as! Filter
        self.present(controller, animated: true, completion: nil)
        
    }
    
    //    MARK:- Pop Up VC
    func presentPopUp(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "PopUp") as! PopUp
        
        self.present(controller, animated: true, completion: nil)
        
        controller.onBtnViewDetails = { _ in
            self.pushToDetailsOneTime()
        }
        controller.onBtnViewMap = { _ in
            self.pushToMap()
        }
    }
    
    func presentNotificationPopUp(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "NotificationPopUp") as! NotificationPopUp
        
        self.present(controller, animated: true, completion: nil)
    
    }
    
    //    MARK:-  Map VC
    func pushToMap(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "Map") as! Map
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    //    MARK:- Detail VC
    func pushToDetailsOneTime(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "DetailsOneTime") as! DetailsOneTime
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    //    MARK:- Calender VC
    func presentCalendar(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "Calender") as! Calender
        self.present(controller, animated: true, completion: nil)
    }
    
}
