//
//  SettingTableViewController.swift
//  SSAC_Diary
//
//  Created by minjoohehe on 2021/10/13.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    // MARK: - PROPERTIES
    let dataSet: [[String]] = [["공지사항", "실험실", "버전 정보"], ["개인/보안","알림", "채팅", "멀티프로필"], ["고객센터/도움말"]]
    let header: [String?] = ["전체 설정", "개인 설정", "기타"]
    
    // MARK: - viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: - Table view data source
    
    //섹션의 수 설정해 주기
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    //필수1. 셀의 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
         dataSet[section].count
        
    }
    
    //필수2. 셀 디자인 및 데이터 처리(재사용 매커니즘)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "setCell")
        
        cell?.textLabel?.text = dataSet[indexPath.section][indexPath.row]
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return header[section]
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
        header?.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        return header
        
    }
    
 

}
