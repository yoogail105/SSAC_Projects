//
//  trendMediaTableViewCell.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/18.
//

import UIKit

class trendMediaTableViewCell: UITableViewCell {
    
    // identifier
    static let identifier = "trendMediaTableViewCell"
    
    
    // IBOutlet
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var castLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var movieCardView: UIView!
    
    
    @IBOutlet weak var rateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


 


