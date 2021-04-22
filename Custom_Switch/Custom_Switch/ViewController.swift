//
//  ViewController.swift
//  Custom_Switch
//
//  Created by Derrick kim on 2021/04/21.
//

import UIKit

class ViewController: UIViewController {

    
    // Fields
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var switchBG: UIView!
    @IBOutlet weak var buttonCenterX: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 해당되는 object의 크기의 반을 주면 Circle 모양이 됨.
        switchButton.layer.cornerRadius = 50 / 2
        
        // 배경
        // 높이의 반값.
        switchBG.layer.cornerRadius = 50 / 2
        
    }

    
    @IBAction func selectedButton(_ sender: UIButton) {
        
        if buttonCenterX.constant == 75 {
            buttonCenterX.constant = -75
            switchBG.backgroundColor = UIColor.lightGray
            
        }else{
            buttonCenterX.constant = 75
            switchBG.backgroundColor = UIColor.yellow
        }// End
        
        // Animation
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            
        }
    }
    
}

