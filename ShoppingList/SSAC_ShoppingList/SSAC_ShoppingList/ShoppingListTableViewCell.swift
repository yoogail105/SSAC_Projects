//
//  ShoppingListTableViewCell.swift
//  SSAC_ShoppingList
//
//  Created by minjoohehe on 2021/11/02.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {
    
    static let identifier = "ShoppingListTableViewCell"

    
    @IBOutlet weak var shoppingLisgInnerView: UIStackView!
    @IBOutlet weak var shoppingListLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var starButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func checkButtonClicked(_ sender: UIButton) {
        
    }
}
