//
//  castInfoViewController.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/18.
//

import UIKit

class castInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var castInfoTableView: UITableView!
    static let identifier = "castInfoViewController"
    
    var castList = [["리처드 헤리스", "덤블도어교장선생님"], ["이안하트", "퀴럴교수"],["피오나 쇼", "이모"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableview protocol
        castInfoTableView.delegate = self
        castInfoTableView.dataSource = self
        
        //pop
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "뒤로", style:  .plain,target:  self, action: #selector(closeButtonClicked))
        navigationItem.title = "출연/제작"
    }
    @objc func closeButtonClicked() {
        // Push - Pop
        self.navigationController?.popViewController(animated: true)

    }
    
    // MARK: - table view
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return castList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "castInfoCell")  else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = castList[indexPath.row][0]
        cell.detailTextLabel?.text = castList[indexPath.row][1]
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 10
    }

}
