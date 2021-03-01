//
//  HeaderTableViewCell.swift
//  MantraDemo
//
//  Created by Ravindra on 27/02/21.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
  @IBOutlet weak var itemName : UILabel!
  @IBOutlet weak var btnOutlet : UIButton!
  @IBOutlet weak var expandableArrowImg: UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
