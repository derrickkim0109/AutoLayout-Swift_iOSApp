//
//  CustomKeyboard.swift
//  Custom_Keyboard
//
//  Created by Derrick kim on 2021/04/20.
//

import UIKit


// delegate <- 위임
protocol CustomKeyboardDelegate {
    func keyboardTapped(str : String)
}

class CustomKeyboard: UIView {
    
    // delegate 는 보통 optional로 선언
    var delegate : CustomKeyboardDelegate?
    
    /*
     
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        // Label의 Title을 가져옴
        delegate!.keyboardTapped(str: sender.titleLabel!.text!)
        
    }
    
    
}
