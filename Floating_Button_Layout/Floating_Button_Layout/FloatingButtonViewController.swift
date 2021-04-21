//
//  FloatingButtonViewController.swift
//  Floating_Button_Layout
//
//  Created by Derrick kim on 2021/04/21.
//

import UIKit

class FloatingButtonViewController: UIViewController {

    
    //------------
    // Properties
    //------------
    
    @IBOutlet weak var btn1CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn2CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn3CenterY: NSLayoutConstraint!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //처음에는 constant가 다 0 이여야 밑으로 내려감.
        btn1CenterY.constant = 0
        btn2CenterY.constant = 0
        btn3CenterY.constant = 0
        
    }
    // Object들이 다나온 시저
    override func viewDidAppear(_ animated: Bool) {
//        1. 간단한 설정
//        UIView.animate(withDuration: 1) {
//
//            self.btn1CenterY.constant = 80
//            self.btn2CenterY.constant = 160
//            self.btn3CenterY.constant = 240
//
//            // 화면 갱신
//            self.view.layoutIfNeeded()
//        }
//
        
//      2. UIView animation 좀더 넣고 싶으면
//         usingSpringWithDamping 0 ~ 1 사이 값을 넣으면 됨 -> 흔들림.
//         0에 가까울 수록 큰값.
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: UIView.AnimationOptions.curveEaseOut, animations: {
            
            self.btn1CenterY.constant = 80
            self.btn2CenterY.constant = 160
            self.btn3CenterY.constant = 240
            
            // 화면 갱신
            self.view.layoutIfNeeded()
            
        }) { (completion) in
            // 애니매이션이 끝나는 시점 클로저
        }
        
    }
    
    @IBAction func dismissFloatingButton(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: UIView.AnimationOptions.curveEaseOut, animations: {
            
            self.btn1CenterY.constant = 0
            self.btn2CenterY.constant = 0
            self.btn3CenterY.constant = 0
            
            // 화면 갱신
            self.view.layoutIfNeeded()
            
        }) { (completion) in
            // 애니매이션이 끝나는 시점 클로저
            // 화면 내리기
            self.dismiss(animated: false, completion: nil)
            
        }
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
