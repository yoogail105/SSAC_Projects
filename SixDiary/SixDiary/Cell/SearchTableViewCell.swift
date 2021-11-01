//
//  SearchTableViewCell.swift
//  SixDiary
//
//  Created by minjoohehe on 2021/11/02.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var diaryImageView: UIImageView!
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    static let identifier = "SearchTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
