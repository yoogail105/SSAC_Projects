//
//  searchViewController.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/18.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class SearchViewController: UIViewController, UITableViewDataSourcePrefetching {
    
    // 필수: 셀이 화면에 보이기 전에 필요한 리소스를 미리 다운 받는 기능
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if movieData.count - 1 == indexPath.row && movieData.count < totalCount {
                startPage += 10
                fetchMovieData()
                print("prefetch: \(indexPath)")
            }
        }
    }
    
    // 옵션: 취소
    func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
            print("취소: \(indexPaths)")
    }
    @IBOutlet weak var searchTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    static let identifier = "SearchViewController"
    
    var movieData: [MovieModel] = []
    var startPage = 1
    var totalCount = 0
    
    // MARK: - viewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
         fetchMovieData()
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.prefetchDataSource = self
        //
        //
        //        searchBar.delegate = self
        //        searchBar.showsCancelButton = true
        //
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonClicked))
        navigationItem.title = "영화 검색"
        //UINavigationItem.BackButtonDisplayMode
        
        uiSetting()
    }
    
    @objc func closeButtonClicked(){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func uiSetting() {}
    //    movieImage.Width = UIScreen.main.bounds.height / 2.5
    
    // MARK: - fetchMovieData
    // 네이버 영화 네트워크 통신
    func fetchMovieData() {
        
        //인코딩하기
        // 쿼리는 옵셔널이기 때문에 처리 해준다.
        // api 숨겨주는 것 체크!!
        
        
        if let query = "사랑".addingPercentEncoding(withAllowedCharacters: .afURLQueryAllowed) {
            let url = "https://openapi.naver.com/v1/search/movie.json?query=\(query)&display=10&start=\(startPage)"
            
            let header: HTTPHeaders = [
                "X-Naver-Client-Id": "TiyeZP9lDqhLOv0v4haf",
                "X-Naver-Client-Secret": "kIOQaeJbEz"
            ]
            
            //비동기 처리하기
            DispatchQueue.global().async {
                
            }
            
            AF.request(url, method: .get, headers: header).validate().responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print("JSON: \(json)")
                    
                    self.totalCount = json["total"].intValue
                    
                    for item in json["items"].arrayValue {
                       
                        let value = item["title"].stringValue.replacingOccurrences(of: "<b>", with: "" ).replacingOccurrences(of: "</b>", with: "")
                        let image = item["image"].stringValue
                        let link = item["link"].stringValue
                        let userRating = item["userRating"].stringValue
                        let sub = item["subtitle"].stringValue
                        let data = MovieModel(titleData: value, imageData: image, linkData: link, userRatingData: userRating, subtitle: sub)
                        self.movieData.append(data)
                    }
                    print(self.movieData)
                    
                    //중요!!
                    DispatchQueue.main.async {
                        self.searchTableView.reloadData()
                    }
                    
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function, movieData.count)
        return movieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        
        let row = movieData[indexPath.row]
        
        // Kingfisher: url은 optional이기 떄문에 nil값에 대해 처리해준다.
        if let url = URL(string: row.imageData) {
            cell.movieImage.kf.setImage(with: url, placeholder: UIImage(named: "background"))
            
        } else {
            cell.movieImage.image = UIImage(named: "background")
        }
       
        cell.movieImage.contentMode = .scaleAspectFill
        cell.movieImage.layer.cornerRadius = 10
        cell.movieImage.layer.masksToBounds = true
        cell.movieTitleLabel.text = row.titleData
        cell.movieSubtitleLabel.text = row.subtitle
        cell.movieUserRatingLabel.text = row.userRatingData
        
        print(row.imageData)
        
        
        return cell
    }
    
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 140
        }
}
extension SearchViewController: UISearchBarDelegate {

    // 컴색 버튼(키보드 리턴키)을 눌렀을 때 실행
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        //프로그래스 바 구현
        /* 새로운 배열 들어왔을 때 초기화
        if let text = searchBar.text {
            movieData.removeAll()
            startPage = 1
            fetchMovieData(query: text)
        }
         */

    }

    // 취소 버튼 눌렀을 때
    func searchBarCanCelButtonClicked( _ searchBar: UISearchBar) {
        //searchBar.showsCancelButton = false
        searchBar.setShowsCancelButton(false, animated: true)

    }

    // 서치바에서 커서 깜빡이기 시작할 때
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        //searchBar.showsCancelButton = true
        searchBar.setShowsCancelButton(true, animated: true)

    }
}
