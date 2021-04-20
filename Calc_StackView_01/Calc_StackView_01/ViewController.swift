//
//  ViewController.swift
//  Calc_StackView_01
//
//  Created by Derrick kim on 2021/04/20.
//

import UIKit

class ViewController: UIViewController {

    
    // Properties
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBOutlet weak var btnNum1: UIButton!
    @IBOutlet weak var btnNum2: UIButton!
    @IBOutlet weak var btnNum3: UIButton!
    @IBOutlet weak var btnNum4: UIButton!
    @IBOutlet weak var btnNum5: UIButton!
    @IBOutlet weak var btnNum6: UIButton!
    @IBOutlet weak var btnNum7: UIButton!
    @IBOutlet weak var btnNum8: UIButton!
    @IBOutlet weak var btnNum9: UIButton!
    @IBOutlet weak var btnNum10: UIButton!
    @IBOutlet weak var btnNum11: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // Label 설정
        displayLabel.layer.cornerRadius = 50
        displayLabel.layer.masksToBounds = true
//        displayLabel.clipsToBounds = true // 둘중하나 사용해도 결과 같음.
        
      
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Button 설정.
        // 정확하게 같은 정사각형 크기여야 함.
        btnNum1.layer.cornerRadius = btnNum1.bounds.width / 2
        btnNum2.layer.cornerRadius = btnNum2.bounds.width / 2
        btnNum3.layer.cornerRadius = btnNum3.bounds.width / 2
        btnNum4.layer.cornerRadius = btnNum4.bounds.width / 2
        btnNum5.layer.cornerRadius = btnNum5.bounds.width / 2
        btnNum6.layer.cornerRadius = btnNum6.bounds.width / 2
        btnNum7.layer.cornerRadius = btnNum7.bounds.width / 2
        btnNum8.layer.cornerRadius = btnNum8.bounds.width / 2
        btnNum9.layer.cornerRadius = btnNum9.bounds.width / 2
        btnNum10.layer.cornerRadius = btnNum10.bounds.height / 2
        btnNum11.layer.cornerRadius = btnNum11.bounds.width / 2
        
    }


}

