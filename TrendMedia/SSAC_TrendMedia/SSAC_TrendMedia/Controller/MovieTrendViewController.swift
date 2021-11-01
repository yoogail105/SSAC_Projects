//
//  movieTrendViewController.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/18.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher


class MovieTrendViewController: UIViewController {
    
    static let identifier = "MovieTrendViewController"
    
    //data
    let tvShowData = TvShowData()
    var weeklyMovieData: [TMDBMovieModel] = []
    var startPage = 1
    var totalCount = 0
    
    @IBOutlet weak var shadowMenuView: UIView!
    @IBOutlet weak var menuButtonsView: UIView!
    
    @IBOutlet weak var trendMediaTableView: UITableView!
    
    //    @IBOutlet weak var shadowTrendMediaView: UIView!
    
    //  @IBOutlet weak var movieCardView: UIView!
    
    // MARK: - ViewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trendMediaTableView.delegate = self
        trendMediaTableView.dataSource = self
       trendMediaTableView.prefetchDataSource = self
        
        weeklyDataLoad()
        // 영화 장르
        //        MoiveGenresAPIManager.shared.fetchMovieData { json in
        //            print("movie genres: \(json)")
        //        }
        
        
        // MARK: - UISetting
        shadowViewSetting(shadowView: shadowMenuView, contentView: menuButtonsView)
        
    } //: ViewDidLoad
    
    func weeklyDataLoad() {
        
        DispatchQueue.global().async {
        //주간 영화 순위 fetch
        WeeklyMovieAPIManager.shared.fetchWeeklyMovieData { json in
    
            
            print(#function, "weekly movie chart list")
            
            for data in json["results"].arrayValue {
                let id = data["id"].intValue
                let movieTitle = data["title"].stringValue
                let voteAverage = data["vote_average"].doubleValue
                let overview = data["overview"].stringValue
                let releaseDate = data["release_date"].stringValue
                //  let genreIds = data["genre_ids"].arrayValue
                let backdropPath = data["backdrop_path"].stringValue
                let posterPath = data["poster_path"].stringValue
                
                let allData = TMDBMovieModel(id: id, movieTitle: movieTitle, voteAverage: voteAverage, overview: overview, releaseDate: releaseDate, backdropPath: backdropPath, posterPath: posterPath)
                self.totalCount += 1
                self.weeklyMovieData.append(allData)
            }
            print(self.totalCount)
          //  print(self.weeklyMovieData)
            DispatchQueue.main.async {
               
                self.trendMediaTableView.reloadData()
            }
        }
        }
    }
    
    func shadowViewSetting(shadowView: UIView, contentView: UIView) {
        shadowView.layer.cornerRadius = 10
        shadowView.layer.shadowColor = UIColor.black
            .cgColor
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowRadius = 10
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }
    
    // MARK: - Navigation: to Search Page
    
    @IBAction func searchButtonClicked(_ sender: UIBarButtonItem) {
        //1. sb
        let sb = storyboard?.instantiateViewController(withIdentifier: MovieTrendViewController.identifier)
        
        //2. vc
        guard let vc = sb?.storyboard?.instantiateViewController(withIdentifier:SearchViewController.identifier) as? SearchViewController else {
            print("ERROR")
            return
        }
        
        
        //2-1 네비게이션 컨트롤러 임베드
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        
        //3. present
        self.present(nav, animated: true, completion: nil)
    }
    
    
    @IBAction func bookButtonClicked(_ sender: UIButton) {
    }
}


//
// MARK: - extension: UITableView -> TableViewCell
extension MovieTrendViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    
        //return tvShowData.tvShow.count
        return weeklyMovieData.count
        
    }
    
    
    // cell 디자인 및 내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        // 사용할 cell 가져오기
        guard let cell =
                trendMediaTableView.dequeueReusableCell(withIdentifier: TrendMediaTableViewCell.identifier) as? TrendMediaTableViewCell else {
                    return UITableViewCell()
                }
        
        
        let row = weeklyMovieData[indexPath.row]
        
        cell.backgroundColor = nil
        //"https://image.tmdb.org/t/p/\(file_size)/\(file_path)"
        // 기본 사진 바꾸기 [ ]
        if let imageUrl = URL(string: Endpoint.MovieImageURL + row.posterPath) {
            cell.posterImageView.kf.setImage(with: imageUrl, placeholder: UIImage(named: "background"))
        } else {
            cell.posterImageView.image = UIImage(named: "background")
        }
        // 데이터의 title과 asset의 이미지 이름 같게 만들어 주기
        // let posterImageName = row.tvShowtitle.replacingOccurrences(of: " ", with: "_").lowercased()
        // cell.posterImageView.image = UIImage(named: posterImageName)
        
        cell.releaseDateLabel.text = (row.releaseDate).replacingOccurrences(of: "-", with: "/")
        cell.genreLabel.text = "#장르"
        cell.titleLabel.text = row.movieTitle
        cell.textLabel?.textColor = .black
        cell.castNamesLabel.text = "배우들"
        cell.castNamesLabel.textColor = .lightGray
        cell.rateLabel.text = String(format: "%.1f", row.voteAverage)
        cell.rateLabel.textColor = .black
        cell.selectionStyle = .none
        shadowViewSetting(shadowView: cell.shadowMovieCardView, contentView: cell.movieCardView)
     
        return cell
        
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UIScreen.main.bounds.height / 1.8
    }
    
    
    // MARK: - Navigation: to CastInformation
    
    //1. sb: 생략
    
    
    // MARK: - TableView 선택하기? -> 화면 전환 & pass data
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //1. sb: 생략 -> self
        //2. vc
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: CastInfoViewController.identifier) as? CastInfoViewController else {
            print("Error")
            return
        }
        
        // pass data
        let row = weeklyMovieData[indexPath.row]
        vc.selectedMovieData = row
        //3. push
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
// MARK: - ERROR: [ ]
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if weeklyMovieData.count - 1 == indexPath.row /*&& weeklyMovieData.count < totalCount*/ {
                startPage += 1
                weeklyDataLoad()
                print(#function, "\(indexPath)")
                print("prefetchRowAt: \(startPage)")
            }

        }
    }

    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
            print(#function, "\(indexPaths)")
    }

    
}

