//
//  DetailsOneTime.swift
//  TrialProject
//
//  Created by Mustafa on 8/8/20.
//  Copyright © 2020 Mustafa. All rights reserved.
//

import UIKit
import iOSDropDown
class DetailsOneTime: BaseController {
    
    // MARK:- Properties
    var obj = DetailOneTimeCVC()
    var dateSaver = "Today"
    var datePicker : UIDatePicker?
    let engineTextField = ["Engine Oil Replacement","Engine Service","Car Maintenance"]
    let numberTextFiled = ["049220","058110","061880"]
    let milageTextFiled = ["3000","4000","5000"]
    let usdDollarTextFiled = ["30","40","50"]
    var imageArrayForCollectionView = [UIImage]()
    
    //MARK:- IBOutlets
    @IBOutlet weak var btnOneTime: ButtonStates!
    @IBOutlet weak var btnRecuring: ButtonStates!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var dateBtnProperties: UIButton!
    @IBOutlet weak var dateTF: UITextField!
    // stacks
    @IBOutlet weak var oneTimeStack: UIStackView!
    @IBOutlet weak var recurringStack: UIStackView!
    //textFields STACK 1
    @IBOutlet weak var EngineBtnProperties: DropDown!
    @IBOutlet weak var numberBtnProperty: DropDown!
    @IBOutlet weak var thenEveryBtnProperty: DropDown!
    @IBOutlet weak var price: DropDown!
    //textFields STACK 2
    @IBOutlet weak var EngineBtnProperties2: DropDown!
    @IBOutlet weak var numberBrnProperty2: DropDown!
    @IBOutlet weak var thenEveryBtnProperty2: DropDown!
    @IBOutlet weak var price2: DropDown!
    
    //@IBOutlet weak var imageCell: UIImageView!
    
    //    MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        recurringStack.isHidden = true
        dateTF.delegate = self
        self.AllTextFieldDropDownFunction()
    }
    
    func AllTextFieldDropDownFunction(){
        self.genericDropDownFunction(textFieldObject: EngineBtnProperties, optionArray: engineTextField)
        self.genericDropDownFunction(textFieldObject: EngineBtnProperties2, optionArray: engineTextField)
        self.genericDropDownFunction(textFieldObject: numberBtnProperty, optionArray: numberTextFiled)
        self.genericDropDownFunction(textFieldObject: numberBrnProperty2, optionArray: numberTextFiled)
        self.genericDropDownFunction(textFieldObject: thenEveryBtnProperty, optionArray: milageTextFiled)
        self.genericDropDownFunction(textFieldObject: thenEveryBtnProperty2, optionArray: milageTextFiled)
        self.genericDropDownFunction(textFieldObject: price, optionArray: usdDollarTextFiled)
        self.genericDropDownFunction(textFieldObject: price2, optionArray: usdDollarTextFiled)
    }
    
    @IBAction func onBtnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK:- IBActions ( OneTime and Recurring Button )
    
    
    @IBAction func onBtnOccur(_ sender: UIButton) {
        
        switch sender.tag {
            case 0:
                self.btnOneTime.isSelected = true
                self.btnRecuring.isSelected = false
                recurringStack.isHidden = true
                oneTimeStack.isHidden = false
            default:
                self.btnOneTime.isSelected = false
                self.btnRecuring.isSelected = true
                oneTimeStack.isHidden = true
                recurringStack.isHidden = false
        }
    }
    
    @IBAction func calendarBtnPressed(_ sender: UIButton) {
        //        super.presentCalendar()
        addDatePicker()
    }
    
    @IBAction func uploadImageBtnPressed(_ sender: UIButton) {
        self.presentGalleryController()
    }
}


//MARK:- Collection View Delegate and Datasource
extension DetailsOneTime:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    //    MARK:- Items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // section 0 -> cell_1 ( IMAGE CELLS )
        if section == 0 {
            return self.imageArrayForCollectionView.count
        }else{
            // section 1 -> cell_2 ( DOTTED CELLS )
            return 1
        }
        
    }
    
    
    //    MARK:- Sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    //    MARK:- Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section{
            case 0:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailOneTimeCVC", for: indexPath) as! DetailOneTimeCVC
                let data = self.imageArrayForCollectionView[indexPath.item]
                cell.setData(data: data)
                
                cell.btnDelete.tag = indexPath.item
                cell.btnDelete.addTarget(self, action: #selector(self.onBtnDeleteImage(_:)), for: .touchUpInside)
                return cell
            default:
                let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "uploadDocumentCVC", for: indexPath) as! DetailOneTimeCVC
                return cell2
        }
    }
    
    
    //    MARK:- Cell Width and Height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionWidth = collectionView.bounds.width
        return CGSize(width: (collectionWidth - 220) - 20, height: (collectionWidth - 220) - 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    @objc func onBtnDeleteImage(_ sender: UIButton){
        let index = sender.tag
        self.imageArrayForCollectionView.remove(at: index)
        self.collectionView.reloadData()
    }
}


//    MARK:- Date Picker View
extension DetailsOneTime: UITextFieldDelegate{
    
    func addDatePicker() {
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        
        dateTF.inputView = datePicker
        
        datePicker?.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        createToolBar()
    }
    
    @objc func dateChange(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM dd yyyy"
        dateTF.text = dateFormatter.string(from: datePicker!.date)
        dateSaver = dateTF.text!
    }
    
    
    // MARK:- Create Tool Bar
    func createToolBar(){
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
        let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelBtnclick))
        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneBtnClick))
        let flexibleBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([cancelBtn,flexibleBtn,doneBtn], animated: false)
        dateTF.inputAccessoryView = toolBar
    }
    
    
    //    MARK:- Cancel Button
    @objc func cancelBtnclick(){
        dateTF.text = String()
        dateTF.text = "Today"
        dateTF.resignFirstResponder()
    }
    
    
    //    MARK:- Done Button
    @objc func doneBtnClick(){
        dateTF.resignFirstResponder()
    }
}


//        MARK:- DropDown Function
extension DetailsOneTime{
    
    func genericDropDownFunction(textFieldObject:DropDown,optionArray:Array<String>){
        textFieldObject.optionArray = optionArray
        textFieldObject.didSelect { (selectedOption, Intindex, Intid) in
            textFieldObject.text = selectedOption
        }
        
    }
    
}


//MARK:- UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension DetailsOneTime: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imageArrayForCollectionView.append(pickedImage)
        }
        self.dismiss(animated: true, completion: {
            self.collectionView.reloadData()
        })
    }
    private func presentGalleryController(){
        let imageController = UIImagePickerController()
        imageController.delegate = self
        imageController.sourceType = .photoLibrary
        self.present(imageController, animated: true, completion: nil)
    }
}
