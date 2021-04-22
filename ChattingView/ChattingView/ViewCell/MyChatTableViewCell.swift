//
//  MyChatTableViewCell.swift
//  ChattingView
//
//  Created by Derrick kim on 2021/04/22.
//

import UIKit

class MyChatTableViewCell: UITableViewCell {

    //-----------------------------------------
    //              Properties
    //-----------------------------------------
    @IBOutlet weak var myTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
