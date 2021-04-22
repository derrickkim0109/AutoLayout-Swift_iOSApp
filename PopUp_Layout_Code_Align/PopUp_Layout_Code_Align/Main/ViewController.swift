//
//  ViewController.swift
//  PopUp_Layout_Code_Align
//
//  Created by Derrick kim on 2021/04/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    // 다른 Story Board로 가기
    @IBAction func showPopUp(_ sender: UIButton) {
        
        
        let popUpStoryboard = UIStoryboard.init(name: "PopUPViewController", bundle: nil)
        
        
        let popupVC = popUpStoryboard.instantiateViewController(identifier: "popupVC")
        
        // PopUpViewController를 호출 할때는 투명하게 하겠다 설정하기
        popupVC.modalPresentationStyle = .overCurrentContext

        // animated: true 는 아래에서 위로
        // animated: false는 바로 나옴.
        self.present(popupVC, animated: false, completion: nil)
    }
    
}

