//
//  ViewController.swift
//  CustomKeyboard
//
//  Created by Eddie Ahn on 02/07/2019.
//  Copyright © 2019 Eddie Ahn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CustomKeyboardDelegate {

    @IBOutlet weak var firstTextField: UITextField!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //커스텀 기보드 설정 방법 
//        firstTextField.inputView = "커스텀 키보드 뷰"
        
        let loadNib = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil, options: nil)
        let myKeyboardView = loadNib?.first as! CustomKeyboard
        myKeyboardView.delegate = self
        firstTextField.inputView = myKeyboardView
    }

    func keyboardTapped(str: String) {
        // 키보드 눌렀을 때 호출 됨.
        let oldNumber = Int(firstTextField.text!)
        var newNumber = Int(str)
        
        if str == "00", oldNumber != nil {
            newNumber = oldNumber! * 100
        }
        if str == "000", oldNumber != nil {
            newNumber = oldNumber! * 1000
        }
        
        if let hasNumber = newNumber {
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            if let formatted = numberFormatter.string(from: NSNumber(value: hasNumber)) {
                firstTextField.text = String(describing: formatted)
            }
        }
    }
}
