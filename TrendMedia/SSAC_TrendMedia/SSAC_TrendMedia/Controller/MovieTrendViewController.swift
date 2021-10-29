//
//  movieTrendViewController.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/18.
//

import UIKit

class MovieTrendViewController: UIViewController {
    
    static let identifier = "MovieTrendViewController"
    
    @IBOutlet weak var trendMediaTableView: UITableView!
    //data
    let tvShowData = TvShowData()
    
    @IBOutlet weak var shadowMenuView: UIView!
    @IBOutlet weak var menuButtonsView: UIView!
    
    
    
//    @IBOutlet weak var shadowTrendMediaView: UIView!
    
  //  @IBOutlet weak var movieCardView: UIView!
    
    // MARK: - ViewdidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trendMediaTableView.delegate = self
        trendMediaTableView.dataSource = self
        
        // MARK: - UISetting
        shadowViewSetting(shadowView: shadowMenuView, contentView: menuButtonsView)

    } //: ViewDidLoad
    
    
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



// MARK: - extension: UITableView -> TableViewCell
extension MovieTrendViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //tvShowData에서 tvShow라는 tuple(?)의 갯수
        return tvShowData.tvShow.count
       
    }
    
    
    // cell 디자인 및 내용
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        // 사용할 cell 가져오기
        guard let cell =
                trendMediaTableView.dequeueReusableCell(withIdentifier: TrendMediaTableViewCell.identifier) as? TrendMediaTableViewCell else {
                    return UITableViewCell()
                }
        
        
        let row = tvShowData.tvShow[indexPath.row]
        
        cell.backgroundColor = nil
        // 데이터의 title과 asset의 이미지 이름 같게 만들어 주기
        let posterImageName = row.tvShowtitle.replacingOccurrences(of: " ", with: "_").lowercased()
        cell.posterImageView.image = UIImage(named: posterImageName)
        
        cell.releaseDateLabel.text = row.releaseDate
        cell.genreLabel.text = "#\(row.genre)"
        cell.titleLabel.text = row.tvShowtitle
        cell.textLabel?.textColor = .black
        cell.castNamesLabel.text = row.starring
        cell.castNamesLabel.textColor = .lightGray
        cell.rateLabel.text = String(row.rate)
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
//
//        let row = trendMediaTVList[indexPath.row]
//            vc.trendMediaTVData = row
        
        let row = tvShowData.tvShow[indexPath.row]
        vc.selectedMovieData = row
        //3. push
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
