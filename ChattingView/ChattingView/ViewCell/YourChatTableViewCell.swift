//
//  YourChatTableViewCell.swift
//  ChattingView
//
//  Created by Derrick kim on 2021/04/22.
//

import UIKit

class YourChatTableViewCell: UITableViewCell {
    
    //-----------------------------------------
    //              Properties
    //-----------------------------------------
    @IBOutlet weak var yourTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
