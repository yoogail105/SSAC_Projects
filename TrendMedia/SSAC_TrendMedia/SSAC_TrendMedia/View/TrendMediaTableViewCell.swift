//
//  trendMediaTableViewCell.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/18.
//

import UIKit

class TrendMediaTableViewCell: UITableViewCell {
    
    // identifier
    static let identifier = "TrendMediaTableViewCell"
    
    
    // IBOutlet
    
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var castNamesLabel: UILabel!
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


 


