//
//  StoryInformationTableViewCell.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/25.
//

import UIKit

class StoryInformationTableViewCell: UITableViewCell {
    
    static let identifier = "StoryInformationTableViewCell"
    
    
    @IBOutlet weak var storyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
