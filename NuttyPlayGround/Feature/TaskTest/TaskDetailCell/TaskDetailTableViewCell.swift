//
//  TaskDetailTableViewCell.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 25/8/2565 BE.
//

import UIKit

class TaskDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(text1: String, text2: String) {
        self.label1.text = text1
        self.label2.text = text2
    }
    
}
