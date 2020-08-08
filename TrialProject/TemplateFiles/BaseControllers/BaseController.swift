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
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBar()
    }
}
extension BaseController{
    
    func setNavigationBar(){
        guard let navigationControllerCount = self.navigationController?.viewControllers.count else { return  }
        if navigationControllerCount > 0 {
            self.navigationController?.navigationBar.isHidden = false
            self.addBackBarButtonItem()
            return
        }else{
            print("no controller found")
        }
        self.resetNavigationBar()
    }
    
    func resetNavigationBar(){
        self.navigationController?.navigationBar.barTintColor = .systemPink
        self.navigationController?.navigationBar.tintColor = .purple
    }
    
}
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
    
    func pushToFilter(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "Filter") as! Filter
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
