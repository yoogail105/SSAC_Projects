//
//  ExTableViewController.swift
//  SSAC_Diary
//
//  Created by minjoohehe on 2021/10/12.
//

import UIKit

class ExTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell")
        cell?.textLabel?.textColor = .blue
        cell?.textLabel?.text = "내용을 입력하세요."
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 0 ? false : true
    }
    
    
}
