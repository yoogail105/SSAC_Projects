//
//  ProductTableViewCell.swift
//  SnapKitPractice
//
//  Created by 성민주민주 on 2021/12/15.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    public var titleLabel: UILabel()
    public var subLabel: UILabel()
    public var priceLabel: UILabel()
    public var heartImgae: UIImageView()
    public var heartCountLabel: UILabel()
    public var chatImage: UIImageView()
    public var chatCountLabel: UILabel()
    public var button: UIButton()
    public
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
