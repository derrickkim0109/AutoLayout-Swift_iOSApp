//
//  ViewController.swift
//  SignIn
//
//  Created by Derrick kim on 2021/04/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var pwErrorLabel: UILabel!
    
    // Height 값 설정.true 활성화
    var emailErrorHeight : NSLayoutConstraint!
    var passwordErrorHeight : NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textfield 값이 변경되는것을 캐치하는게 없음 -> setting 해야함
        emailTextField.addTarget(self, action: #selector(textFieldEdited), for: UIControl.Event.editingChanged)
        
        passwordTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        
        // Height 값 설정.true 활성화
        emailErrorHeight =   emailErrorLabel.heightAnchor.constraint(equalToConstant: 0)
        
        // Height 값 설정.true 활성화
        passwordErrorHeight = pwErrorLabel.heightAnchor.constraint(equalToConstant: 0)
    }
    
    @objc func textFieldEdited(textField : UITextField){
        
        if textField == emailTextField {
            print("이메일 텍스트 필드 \(textField.text)")
            
            
            // 정규식이 맞으면~
            if isValidEmail(textField.text) == true {
                // 에러표시가 안나와야함
                emailErrorHeight.isActive = true
            
            // 정규식 안맞을 경우
            }else{
                emailErrorHeight.isActive = false
            }
        }
        else if textField == passwordTextField{
            print("비밀번호 텍스트 필드 \(textField.text)")
            
            if isValidPassword(pw: textField.text) == true {
                passwordErrorHeight.isActive = true
            }else{
                passwordErrorHeight.isActive = false
            }
        }
        
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
        
    }
   
    //----------------------------
    // 정규식 - regular expression
    //----------------------------
    // 이메일 정규식.
    func isValidEmail(_ email: String?) -> Bool {
        
        guard email != nil else {
            return false
        }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        // evaluate -> true, false로 나오게 해줌.
        return emailPred.evaluate(with: email)
        
    }

    // 비밀번호 정규식.
    func isValidPassword(pw: String?) -> Bool{
        
        // 더 깔끔하게 할려면 if let 써야함.
        if let hasPassword = pw {
            if hasPassword.count < 8 {
                return false
            }
        }
        return true
    }
    
    
} //------END

