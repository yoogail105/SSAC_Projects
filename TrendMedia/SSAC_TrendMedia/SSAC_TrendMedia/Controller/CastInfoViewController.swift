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
    var selectedMovieData: TMDBMovieModel?
    let tvShowData = TvShowData()
    var isLong = false
    // 사용할 selectedMovie 내용
    var castNames: [String] = []
    var overviewData = ""
    
    // MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableview protocol
        informationTableView.delegate = self
        informationTableView.dataSource = self
        
        // xib
        let nibName = UINib(nibName: CastInfoTableViewCell.identifier, bundle: nil)
        informationTableView.register(nibName, forCellReuseIdentifier: CastInfoTableViewCell.identifier)
        
        // MARK: - ERROR: reason: 'Could not load NIB in bundle: 'NSBundle [ ]
        let overviewNibName = UINib(nibName: OverViewTableViewCell.identifier, bundle: nil)
        informationTableView.register(overviewNibName, forCellReuseIdentifier: OverViewTableViewCell.identifier)
        
        
        
        //pop
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "뒤로", style:  .plain, target:  self, action: #selector(closeButtonClicked))
        navigationItem.title = "출연/제작"
        
        // optional 대응
        if selectedMovieData != nil {
            setMovieImage(movieData: selectedMovieData!)
            // MARK: - castname
            castNames = tvShowData.tvShow[1].starring.components(separatedBy: ", ")
            overviewData = selectedMovieData!.overview
        } else {
            // data없다면 기본 이미지
            movieBackgroundImage.image = UIImage(named: "background")
            moviePosterImage.image = UIImage(named: "background")
            castNames = ["출연진 정보가 없습니다."]
            overviewData = "줄거리 정보가 없습니다."
        }
        
        //TableViewAutomaticDimension
        
    }//: viewDidLoad()
    
    @objc func closeButtonClicked() {
        // Push - Pop
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
    // Kingfisher
    func setMovieImage(movieData: TMDBMovieModel){
        let movieBackUrl = URL(string: Endpoint.MovieImageURL + movieData.backdropPath)
        movieBackgroundImage.kf.setImage(with: movieBackUrl, placeholder: UIImage(named: "background"))
        
        let moviePosterUrl = URL(string: Endpoint.MovieImageURL + movieData.posterPath)
        moviePosterImage.kf.setImage(with: moviePosterUrl, placeholder: UIImage(named: "background"))
    }
    
    
}

// MARK: - table view
extension CastInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return section == 0 ? 1 : castNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if selectedMovieData != nil {
            
            if indexPath.section == 0 {
                
                guard let cell = informationTableView.dequeueReusableCell(withIdentifier: OverViewTableViewCell.identifier) as? OverViewTableViewCell else {
                    return UITableViewCell()
                }
                
                cell.overviewLabel.text = overviewData
                
                if isLong == true {
                    cell.chevronButton.setImage(UIImage(systemName: "chevron.up"), for: .normal)
                } else {
                    cell.chevronButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
                   
                }
                return cell
                
            } else {
                guard let cell = informationTableView.dequeueReusableCell(withIdentifier: CastInfoTableViewCell.identifier) as? CastInfoTableViewCell else {
                    return UITableViewCell()
                }
                
                
                // 데이터의 title과 asset의 이미지 이름 같게 만들어 주기
                // cell.starImage.image = UIImage(named: "backgroundcell    SSAC_TrendMedia.overviewTableViewCell    0x0000000106c113b0")
                cell.starImage.image = UIImage(named: "starImage")
                cell.starImage.layer.cornerRadius = 10
                cell.starImage.contentMode = .scaleAspectFill
                cell.realName.text = castNames[indexPath.row]
                cell.roleName.text =  "뫄뫄 역할"
                
                return cell
            }
        } else {
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 100
        }
        else {
            return UIScreen.main.bounds.height / 10
        }
    }
}
    
    //lines 잊지 말기! 오토메틱디멘션: 태그/매개변수 등 다양한 방법이 있다.
    
    
    
