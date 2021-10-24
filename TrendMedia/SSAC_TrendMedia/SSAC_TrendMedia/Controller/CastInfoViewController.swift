//
//  castInfoViewController.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/18.
//

import UIKit
import Kingfisher

class CastInfoViewController: UIViewController {
    static let identifier = "CastInfoViewController"
    
    @IBOutlet weak var movieBackgroundImage: UIImageView!
    @IBOutlet weak var informationTableView: UITableView!
 
    
    let tvShowData = TvShowData()
    //let selectedMovie:
    let castNames: [String] = []
    // MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableview protocol
        informationTableView.delegate = self
        informationTableView.dataSource = self
        
        // xib
        let nibName = UINib(nibName: CastInfoTableViewCell.identifier, bundle: nil)
        informationTableView.register(nibName, forCellReuseIdentifier: CastInfoTableViewCell.identifier)
        
        
        
        //pop
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "뒤로", style:  .plain, target:  self, action: #selector(closeButtonClicked))
        navigationItem.title = "출연/제작"
        //  let url = URL(string: "https://example.com/image.png")
        // imageView.kf.setImage(with: url)
        //  movieBackgroundImage.image
        
        
    }//: viewDidLoad()
    
    @objc func closeButtonClicked() {
        // Push - Pop
        self.navigationController?.popViewController(animated: true)
        
    }
}

// MARK: - table view
extension CastInfoViewController: UITableViewDelegate, UITableViewDataSource {
    

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return section == 0 ? 1 : 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let row = tvShowData.tvShow[indexPath.row]
        
        if indexPath.section == 0 {
            
            guard let cell = informationTableView.dequeueReusableCell(withIdentifier: StoryInformationTableViewCell.identifier) as? StoryInformationTableViewCell else {
                return UITableViewCell()
            }
            cell.storyLabel.text = row.overview
            
            return cell
            
        } else {
            guard let cell = informationTableView.dequeueReusableCell(withIdentifier: CastInfoTableViewCell.identifier) as? CastInfoTableViewCell else {
                return UITableViewCell()
            }
            
            // 데이터의 title과 asset의 이미지 이름 같게 만들어 주기
           // cell.starImage.image = UIImage(named: "background")
            cell.realName.text = "리처드해린슨"
            cell.roleName.text =  "뫄뫄"
            
            
            return cell
        }
    }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UIScreen.main.bounds.height / 10
        }
        
}
    //lines 잊지 말기! 오토메틱디멘션: 태그/매개변수 등 다양한 방법이 있다.
    

