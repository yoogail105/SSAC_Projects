//
//  BoxOfficeTableViewCell.swift
//  SSAC_Diary
//
//  Created by minjoohehe on 2021/10/13.
//

import UIKit

class BoxOfficeTableViewCell: UITableViewCell {

    @IBOutlet weak var poseterImageVIew: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDeteLabel: UILabel!
    @IBOutlet weak var overViewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
