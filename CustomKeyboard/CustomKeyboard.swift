//
//  CustomKeyboard.swift
//  CustomKeyboard
//
//  Created by Eddie Ahn on 02/07/2019.
//  Copyright © 2019 Eddie Ahn. All rights reserved.
//

import UIKit

//delegate - 기능, 값 위임
protocol CustomKeyboardDelegate {
    func keyboardTapped(str: String)
}

class CustomKeyboard: UIView {
    
    var delegate: CustomKeyboardDelegate? // protocol을 사용할 수 있도록 연결해주는 변수 선언 주로 delegate이름으로 사용. 보통 옵셔널로 선언. 

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        delegate?.keyboardTapped(str: sender.titleLabel!.text!)
   
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
