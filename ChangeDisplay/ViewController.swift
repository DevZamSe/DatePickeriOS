//
//  ViewController.swift
//  ChangeDisplay
//
//  Created by Nilo Vila on 2/21/20.
//  Copyright © 2020 Nilo Vila. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var myPicker: UIPickerView!
    @IBOutlet weak var myPageControl: UIPageControl!
    
    private let myPickerViewValues = ["uno", "dos", "tres", "cuatro", "cinco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signIn.layer.cornerRadius = 10  
        signIn.layer.masksToBounds = true
        signIn.backgroundColor = .red
        
        myPickerView.backgroundColor = .lightGray
        myPickerView.dataSource = self
        myPickerView.delegate = self
    
        myPageControl.numberOfPages = myPickerViewValues.count
        myPageControl.currentPageIndicatorTintColor = .blue
        myPageControl.pageIndicatorTintColor = .lightGray
    }

    @IBAction func myButtonAction(_ sender: Any) {
        if signIn.backgroundColor == .red {
            signIn.backgroundColor = .green
        } else {
            signIn.backgroundColor = .red
        }
    }
    
    @IBAction func myPageControlAction(_ sender: Any) {
        myPickerView.selectRow(myPageControl.currentPage, inComponent: 0, animated: true)
        
        let myString = myPickerViewValues[myPageControl.currentPage]
        signIn.setTitle(myString, for: .normal)
    }
    
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerViewValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerViewValues[row]
    }
    
    //si tenemos más componentes
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let myString = myPickerViewValues[row]
        signIn.setTitle(myString, for: .normal)
        
        myPageControl.currentPage = row
    }
}

