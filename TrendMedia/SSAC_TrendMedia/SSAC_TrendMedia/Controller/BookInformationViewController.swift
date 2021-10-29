//
//  BookInformationViewController.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/20.
//  도서버튼 눌렀을 때 등장하는 화면

import UIKit

class BookInformationViewController: UIViewController {

    // MARK: - PROPERTIES
    @IBOutlet weak var bookInformationCollectionView: UICollectionView!
    
    let tvShowData = TvShowData()
    
    // MARK: - veiwDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()

        
        bookInformationCollectionView.delegate = self
        bookInformationCollectionView.dataSource = self
        
        let nibName = UINib(nibName: BookInformationCollectionViewCell.identifier, bundle: nil)
        bookInformationCollectionView.register(nibName, forCellWithReuseIdentifier: BookInformationCollectionViewCell.identifier)
        
        //FlowLayout 설정
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        let width = UIScreen.main.bounds.width - (spacing * 3)
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.scrollDirection = .vertical
        bookInformationCollectionView.collectionViewLayout = layout
    }
    


}

extension BookInformationViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tvShowData.tvShow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookInformationCollectionViewCell.identifier, for: indexPath) as? BookInformationCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let row = tvShowData.tvShow[indexPath.row]
        
        // cell data
        let posterImageName = row.tvShowtitle.replacingOccurrences(of: " ", with: "_").lowercased()
        cell.moviePosterImage.image = UIImage(named: posterImageName)
        cell.movieRateLabel.text = String(row.rate)
        cell.movieTitleLabel.text = row.tvShowtitle
        
        // cell design
        cell.layer.cornerRadius = 10
        cell.colorBackgroundView.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
        return cell
    }
    
    
}

