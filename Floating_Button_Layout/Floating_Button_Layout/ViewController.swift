//
//  ViewController.swift
//  Floating_Button_Layout
//
//  Created by Derrick kim on 2021/04/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "sgShowPopUp"{
            let floatingVC = segue.destination as! FloatingButtonViewController
            
            // 화면 투명하게 나오게 설정(mainstoryboard에서).-> 그다음 코딩.
            floatingVC.modalPresentationStyle = .overCurrentContext
        }
    }
}

