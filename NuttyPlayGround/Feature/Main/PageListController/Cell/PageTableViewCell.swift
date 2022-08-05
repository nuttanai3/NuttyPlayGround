//
//  PageTableViewCell.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 25/1/2564 BE.
//

import UIKit

class PageTableViewCell: UITableViewCell {
    @IBOutlet var pageName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setLabel(pageList: PageListModel) {
        pageName.text = pageList.pageName
    }
}
