//
//  ViewController.swift
//  Basic_21_AutoLayout_Code_Anchor_01
//
//  Created by Derrick kim on 2021/04/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // Button을 Main StoryBoard에 추가 하는 법
        let myButton = UIButton.init(type: .system)
        myButton.setTitle("My Button", for: .normal)
        
        self.view.addSubview(myButton)
        
        // 크기와 위치에 대한 설정이 없으면 안나옴. //
        
        
        myButton.translatesAutoresizingMaskIntoConstraints = false // 반대인 true하면 autooreszing 안하겠다는 의미
        // Constraints 설정
//        myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        // 위에것 대신 하는 것.
//        myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -100).isActive = true
        myButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20).isActive = true
        
    }


}

