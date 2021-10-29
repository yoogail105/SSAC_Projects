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
    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var informationTableView: UITableView!
 
    // MovieTrendVC 에서 온 data
    var selectedMovieData: TvShow?

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
        
        // var selectedMovieData: TvShow?
        if selectedMovieData != nil {
            setBackgroundImage(movieData: selectedMovieData!)
            // 계속사용할수있도록 바꾸기 [ ]
            let posterImageName = selectedMovieData?.tvShowtitle.replacingOccurrences(of: " ", with: "_").lowercased()
            moviePosterImage.image = UIImage(named: posterImageName!) //강제해제 처리하기 [ ]
        } else {
            movieBackgroundImage.image = UIImage(named: "background")
        }
        
        
      
        
        
        
    }//: viewDidLoad()
    
    @objc func closeButtonClicked() {
        // Push - Pop
        self.navigationController?.popViewController(animated: true)
        
    }
    
    // Kingfisher
    func setBackgroundImage(movieData: TvShow){
        let url = URL(string: movieData.backdropImage)
        movieBackgroundImage.kf.setImage(with: url)
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
        
        
        //let row = selectedMovieData.starring
       
        if indexPath.section == 0 {
            
            guard let cell = informationTableView.dequeueReusableCell(withIdentifier: StoryInformationTableViewCell.identifier) as? StoryInformationTableViewCell else {
                return UITableViewCell()
            }
          //  cell.storyLabel.text = selectedMovieData.overview
            
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
    

