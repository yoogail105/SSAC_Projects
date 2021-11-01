//
//  SearchViewController.swift
//  SixDiary
//
//  Created by minjoohehe on 2021/11/01.
//

import UIKit

class SearchViewController: UIViewController {

    
    @IBOutlet weak var searchTableView: UITableView!
    
    var sampleContents = [["오늘의 일기는요", "2021-10-29", "뫄모마ㅗ마뫄뫄모마ㅗ모마뫄뫄뫄뫄뫄모마ㅗ마ㅗ마ㅗ마뫄뫄뫄뫄뫄모마ㅗ마ㅗㅁ"], ["오늘의 일기는요", "2021-10-29", "뫄모마ㅗ마뫄뫄모마ㅗ모마뫄뫄뫄뫄뫄모마ㅗ마ㅗ마ㅗ마뫄뫄뫄뫄뫄모마ㅗ마ㅗㅁ"], ["오늘의 일기는요", "2021-10-29", "뫄모마ㅗ마뫄뫄모마ㅗ모마뫄뫄뫄뫄뫄모마ㅗ마ㅗ마ㅗ마뫄뫄뫄뫄뫄모마ㅗ마ㅗㅁ"], ["오늘의 일기는요", "2021-10-29", "뫄모마ㅗ마뫄뫄모마ㅗ모마뫄뫄뫄뫄뫄모마ㅗ마ㅗ마ㅗ마뫄뫄뫄뫄뫄모마ㅗ마ㅗㅁ"], ["오늘의 일기는요", "2021-10-29", "뫄모마ㅗ마뫄뫄모마ㅗ모마뫄뫄뫄뫄뫄모마ㅗ마ㅗ마ㅗ마뫄뫄뫄뫄뫄모마ㅗ마ㅗㅁ"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        let nibName = UINib(nibName: SearchTableViewCell.identifier, bundle: nil)
        searchTableView.register(nibName, forCellReuseIdentifier: SearchTableViewCell.identifier)
    }

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleContents.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = searchTableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        
        let row = sampleContents[indexPath.row]
        
        cell.titleLabel.text = row[0]
        cell.dateLabel.text = row[1]
        cell.contentLabel.text = row[2]
        cell.diaryImageView.image = UIImage(named: "diaryBackground")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 8
    }
    
}
