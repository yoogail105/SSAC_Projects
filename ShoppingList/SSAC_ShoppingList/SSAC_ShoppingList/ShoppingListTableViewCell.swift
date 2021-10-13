//
//  ShoppingListTableViewCell.swift
//  SSAC_ShoppingList
//
//  Created by minjoohehe on 2021/10/14.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var starButton: UIButton!

    @IBOutlet weak var listLabel: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    

        // Configure the view for the selected state
    }

}
