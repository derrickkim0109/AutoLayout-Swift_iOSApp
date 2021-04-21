//
//  ViewController.swift
//  Graph_Layout
//
//  Created by Derrick kim on 2021/04/21.
//

import UIKit


class ViewController: UIViewController {

    // -----------
    // Properties
    // -----------
    
    @IBOutlet weak var graphFirstHeight: NSLayoutConstraint!
    @IBOutlet weak var graphSecondHeight: NSLayoutConstraint!
    @IBOutlet weak var graphThirdHeight: NSLayoutConstraint!
    @IBOutlet weak var graphFourthHeight: NSLayoutConstraint!
    @IBOutlet weak var graphFifthHeight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        graphFirstHeight.constant = 500
//        graphFirstHeight.priority = UILayoutPriority(rawValue: 700)
//        
        // Multiplier를 설정할수 없음 NSLayout을 새로 만들어서 설정해야함.
//        graphFirstHeight.multiplier = 0.5
        
      
    }

    @IBAction func styleNum1(_ sender: UIButton) {

        // Animation
        UIView.animate(withDuration: 0.5) {
            
            // 새로 만들어서 Multiplier 설정함.
            // 1.
            self.graphFirstHeight = self.graphFirstHeight.changeMultiplier(value: 0.9)
            // 2.
            self.graphSecondHeight = self.graphSecondHeight.changeMultiplier(value: 0.8)
            // 3.
            self.graphThirdHeight = self.graphThirdHeight.changeMultiplier(value: 0.7)
            // 4.
            self.graphFourthHeight = self.graphFourthHeight.changeMultiplier(value: 0.6)
            // 5.
            self.graphFifthHeight = self.graphFifthHeight.changeMultiplier(value: 0.5)
            
            self.view.layoutIfNeeded()

        }
        
    }
    @IBAction func styleNum2(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5) {
            // 새로 만들어서 Multiplier 설정함.
            // 1.
            self.graphFirstHeight = self.graphFirstHeight.changeMultiplier(value: 0.5)
            // 2.
            self.graphSecondHeight = self.graphSecondHeight.changeMultiplier(value: 0.6)
            // 3.
            self.graphThirdHeight = self.graphThirdHeight.changeMultiplier(value: 0.7)
            // 4.
            self.graphFourthHeight = self.graphFourthHeight.changeMultiplier(value: 0.8)
            // 5.
            self.graphFifthHeight = self.graphFifthHeight.changeMultiplier(value: 0.9)
            
            self.view.layoutIfNeeded()
        }
    
    }
    
    
    
    

}
extension NSLayoutConstraint{
    
    func changeMultiplier(value : CGFloat) -> NSLayoutConstraint{
        
        // 여기값을 다 비활성화 (Constraint)
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint.init(item: self.firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: value, constant: self.constant)
        
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        // 새로 만든것으로 활성화 (Constraint)
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
    
}
