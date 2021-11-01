//
//  overviewTableViewCell.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/29.
//

import UIKit

class OverViewTableViewCell: UITableViewCell {
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var chevronButton: UIButton!
    
    static let identifier = "OverViewTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
