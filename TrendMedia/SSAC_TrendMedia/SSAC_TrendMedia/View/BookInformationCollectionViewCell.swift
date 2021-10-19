//
//  BookInformationCollectionViewCell.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/20.
//

import UIKit

class BookInformationCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "BookInformationCollectionViewCell"

    @IBOutlet weak var colorBackgroundView: UIView!
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieRateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
