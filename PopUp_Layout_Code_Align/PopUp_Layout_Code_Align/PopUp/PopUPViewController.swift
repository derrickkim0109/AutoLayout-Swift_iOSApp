//
//  PopUPViewController.swift
//  PopUp_Layout_Code_Align
//
//  Created by Derrick kim on 2021/04/22.
//

import UIKit

class PopUPViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closePopUpButton(_ sender: UIButton){
        self.dismiss(animated: false, completion: nil)
    }

    @IBAction func closeImageButton(_ sender: UIButton){
        self.dismiss(animated: false, completion: nil)
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
