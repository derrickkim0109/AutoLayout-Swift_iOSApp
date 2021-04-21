//
//  ViewController.swift
//  Custom_Keyboard
//
//  Created by Derrick kim on 2021/04/20.
//

import UIKit

class ViewController: UIViewController, CustomKeyboardDelegate {
   
    

    
    
    //  Fields
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    
    var displayNumber :String = ""
    var touchTypingBool = false
    //----------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        
        // CustomKeyboard.xib View를 불러올려면!.
        // owner : self -> 이 컨트롤러에서 써야하면 // owner : nil 여기 안써도 되면.
        let loadNibView = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil, options: nil)
        
        // Array 개념이다. -> xib에 내가 만들어 놓은 View가 첫번째 것이니까.
        let myKeyboardView = loadNibView?.first as! CustomKeyboard
        
        
        // delegate
        myKeyboardView.delegate = self
        
        
        // 커스텀 키보드 설정 방법
        firstTextField.inputView = myKeyboardView
    }
    
    // Delegate
    func keyboardTapped(str: String) {
        // 키보드 눌렀을 때 호출 됨.
//        print(str)
        
        let oldNumber = Int(firstTextField.text!)
        var newNumber = Int(str)
        
        if str == "00" && oldNumber != nil {
            newNumber = oldNumber! * 100
        }
        if str == "000" && oldNumber != nil {
            newNumber = oldNumber! * 1000
        }
        // newNumber Type이 Optional로 되있는 것을 확인
        // -> optional타입을 벗겨낼려면 if let을 사용해야함.
        if let hasNumber = newNumber {
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal // 숫자 값에 , 를 넣는 것.
            
            if let formatted = numberFormatter.string(from: NSNumber(value: hasNumber)){
                firstTextField.text = String(describing: formatted)
            }
            
            
        }
        
        
        

        
        
        
    }

}

