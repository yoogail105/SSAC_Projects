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
    
    //tableVeiw 필수 1.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    //tableView 필수 2.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //타입캐스팅: 커스텀 클래스와 연결해 주는 것.
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

    //tableView 높이
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 5
    }
}
