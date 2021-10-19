//
//  movieTrendViewController.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/18.
//

import UIKit

class movieTrendViewController: UIViewController {
    
    static let identifier = "movieTrendViewController"
    
    //data
    let tvShowData = TvShowData()
    
    @IBOutlet weak var menuButtonView: UIView!
    
    @IBOutlet weak var trendMediaTableView: UITableView!
    
    // MARK: - ViewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        trendMediaTableView.delegate = self
        trendMediaTableView.dataSource = self
        
        menuButtonView.layer.cornerRadius = 10
        menuButtonView.layer.masksToBounds = true
    } //: ViewDidLoad
    
    
    
    // MARK: - Navigation: to Search Page
    
    @IBAction func searchButtonClicked(_ sender: UIBarButtonItem) {
        //1. sb
        let sb = storyboard?.instantiateViewController(withIdentifier: movieTrendViewController.identifier)
        
        //2. vc
        guard let vc = sb?.storyboard?.instantiateViewController(withIdentifier:searchViewController.identifier) as? searchViewController else {
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



// MARK: - extension: UITableView -> TableViewCell
extension movieTrendViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //tvShowData에서 tvShow라는 tuple(?)의 갯수
        return tvShowData.tvShow.count
        print(tvShowData.tvShow.count)
    }
    
    
    // cell 디자인 및 내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        // 사용할 cell 가져오기
        guard let cell =
                trendMediaTableView.dequeueReusableCell(withIdentifier: trendMediaTableViewCell.identifier) as? trendMediaTableViewCell else {
                    return UITableViewCell()
                }
        
        
        let row = tvShowData.tvShow[indexPath.row]
        
        // 데이터의 title과 asset의 이미지 이름 같게 만들어 주기
        let posterImageName = row.title.replacingOccurrences(of: " ", with: "_").lowercased()
        cell.posterImageView.image = UIImage(named: posterImageName)
        
        cell.releaseDateLabel.text = row.releaseDate
        cell.genreLabel.text = "#\(row.genre)"
        cell.titleLabel.text = row.title
        cell.textLabel?.textColor = .black
        cell.castLabel.text = row.starring
        cell.castLabel.textColor = .lightGray
        cell.rateLabel.text = String(row.rate)
        cell.rateLabel.textColor = .black
        cell.movieCardView.layer.cornerRadius = 10
        cell.movieCardView.layer.masksToBounds = true
        cell.movieCardView.layer.borderWidth = 1.0
        cell.movieCardView.layer.shadowRadius = 10
        
        
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        
        return UIScreen.main.bounds.height / 2
    }
    
    
    // MARK: - Navigation: to CastInformation
    
    //1. sb: 생략
    
    
    // MARK: - TableView 선택하기?
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //1. sb: 생략
        //2. vc
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: castInfoViewController.identifier) as? castInfoViewController else {
            print("Error")
            return
        }
        //3. push
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
}