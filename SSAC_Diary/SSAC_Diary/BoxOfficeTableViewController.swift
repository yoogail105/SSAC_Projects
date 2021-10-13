//
//  BoxOfficeTableViewController.swift
//  SSAC_Diary
//
//  Created by minjoohehe on 2021/10/13.
//

import UIKit

class BoxOfficeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //타입캐스팅
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BoxOfficeTableViewCell", for: indexPath) as? BoxOfficeTableViewCell else{
            return UITableViewCell()
        }
        
        cell.poseterImageVIew.backgroundColor = .red
        cell.titleLabel.text = "7번방의 선물"
        cell.releaseDeteLabel.text = "2021.02.02"
        cell.overViewLabel.text = "영화 줄거리가 보이는 곳입니다.영화 줄거리가 보이는 곳입니다.영화 줄거리가 보이는 곳입니다.영화 줄거리가 보이는 곳입니다.영화 줄거리가 보이는 곳입니다.영화 줄거리가 보이는 곳입니다.영화 줄거리가 보이는 곳입니다."
        cell.overViewLabel.numberOfLines = 0
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 5
    }
}
