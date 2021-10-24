//
//  CastInfoTableViewCell.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/25.
//

import UIKit

class CastInfoTableViewCell: UITableViewCell {
    static let identifier = "CastInfoTableViewCell"
    
    
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var realName: UILabel!
    @IBOutlet weak var roleName: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
