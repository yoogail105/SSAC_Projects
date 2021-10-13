//
//  ShppingListTableViewController.swift
//  SSAC_ShoppingList
//
//  Created by minjoohehe on 2021/10/14.
//

import UIKit

class ShppingListTableViewController: UITableViewController {
    
    // MARK: - PROPERTIES
    @IBOutlet weak var writeTextFiled: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var list: [String?] = ["과자","쇼핑"] {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - TABLE VIEW
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
   
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingListTableViewCell", for: indexPath) as? ShoppingListTableViewCell else {
            return UITableViewCell()
        }
        
      //  cell.textLabel?.text = list[indexPath.row]
        //cell.textLabel?.textColor = .brown
        cell.listLabel.text = list[indexPath.row]
        cell.listLabel.textColor = .brown
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UIScreen.main.bounds.height / 10
    }
    @IBAction func addButtonClicked(_ sender: UIButton) {
        
        list.append(writeTextFiled.text)
    }
}
