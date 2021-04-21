//
//  TableViewCell.swift
//  Expand_Cell
//
//  Created by Derrick kim on 2021/04/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var decriptionLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
