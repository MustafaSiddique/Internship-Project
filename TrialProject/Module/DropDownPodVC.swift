//
//  ForUsingPodVC.swift
//  TrialProject
//
//  Created by Mustafa on 8/10/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import UIKit
import iOSDropDown
class ForUsingPodVC: UIViewController {

    
    @IBOutlet weak var poftf: DropDown!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        function()
    }
    
    func function(){
        // The list of array to display. Can be changed dynamically
          //  TFforusingPod
         //Its Id Values and its optional
        poftf.optionArray = ["1","23","54","22"]
        poftf.optionIds = [1,2,3,5]
        poftf.optionArray = ["Option 1", "Option 2", "Option 3"]
        
         // Image Array its optional
        
         // The the Closure returns Selected Index and String
         poftf.didSelect{(selectedText , index ,id) in
//         self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
            print(selectedText, index, id)
         }
    }
 //@IBOutlet weak var dropDown : DropDown!
    
 
}
