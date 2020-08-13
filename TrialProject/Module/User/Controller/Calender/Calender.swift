//
//  Calender.swift
//  TrialProject
//
//  Created by Mustafa on 8/9/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import UIKit
import FSCalendar

class Calender: BaseController, FSCalendarDelegate {
    
    //    MARK:- Properties
    let backgroundGradientColors = [UIColor(red: 0.12, green: 0.12, blue: 0.17, alpha: 1.00),
                                    UIColor(red: 0.18, green: 0.22, blue: 0.29, alpha: 1.00),
                                    UIColor(red: 0.23, green: 0.27, blue: 0.33, alpha: 1.00)]
    
    //    MARK:- IBOutlets
    @IBOutlet weak var calenderView: FSCalendar!
    @IBOutlet weak var backgroundGradient: UIView!
    @IBOutlet var mianViewBackGroundGradient: UIView!
    
    //    MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        backGroundGradientColour()
    }
    
    //    MARK:- Calender Date
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE dd-MM-YYYY"
        let string = formatter.string(from: date)
        print(string)
    }
}

//    MARK:- Background Gradient
extension Calender{
    
    func backGroundGradientColour(){
        let layer = CAGradientLayer()
        layer.frame = self.backgroundGradient.bounds
        layer.colors = backgroundGradientColors
        layer.startPoint = CGPoint(x: 0, y: 0.2)
        layer.endPoint = CGPoint(x:0.8, y: 0.7)
        self.backgroundGradient.layer.addSublayer(layer)
    }
    
}
