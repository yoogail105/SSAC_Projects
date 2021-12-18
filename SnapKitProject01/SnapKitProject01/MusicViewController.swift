//
//  MusicViewController.swift
//  SnapKitProject01
//
//  Created by 성민주민주 on 2021/12/17.
//

import UIKit
import SnapKit

class MusicViewController: UIViewController {
    
    /*
     let purbleButotn: MainActivateButton = {
         let button = MainActivateButton()
         button.setTitle("클릭하세요", for: .normal)
         button.addTarget(self, action: #selector(SubActivateButtonClicked), for: .touchUpInside)
         return button
     }()
     */
    
    let headerBox: UIView = {
       let view = UIView()
       // view.backgroundColor = .gray
        return view
    }()
    
    let bodyBox: UIView = {
        let view = UIView()
        //view.backgroundColor = .gray
        return view
    }()
    
    let middleBar: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let musicImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "music.note.list")
        image.tintColor = .lightGray
        return image
    }()
    
    let musicTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "strawberry moon"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.text = "아이유"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    // 아래로 향하는 화살표 Button
    // infoButton
    let albumImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "iuSong.jpeg")
        
        return image
    }()
    
    
    let heartButton: UIButton = {
      let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    
    let heartLabel: UILabel = {
        let label = UILabel()
        label.text = "101,354"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    let similarButton: UIButton = {
       let button = UIButton()
        button.setTitle("유사곡", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10)
        button.tintColor = .lightGray
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        return button
    }()
    
    let instagramButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square.dashed.inset.filled"), for: .normal)
        button.tintColor = .white
       return button
    }()
    
    let lyricBox: UIView = {
        let view = UIView()
        return view
    }()
    
    let lyricLabel: UILabel = {
        let label = UILabel()
        label.text = "달이 익어가니 서둘러 젊은 피야\n민들레 한 송이 들고"
        label.textColor = .white
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textAlignment = .center
        return label
    }()
    // modeButton
    // progressBarImage
    // modeButton
    // listButton
    // preButton
    // stopButton
    // nextButton
    // soundButton
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         moneyLabel.snp.makeConstraints { make in
             make.centerX.equalTo(view)
             make.centerY.equalTo(view)
             make.width.equalTo(300)
             make.height.equalTo(80)
         }
         
         activateButton.snp.makeConstraints {
             $0.leadingMargin.equalTo(view)
             $0.trailingMargin.equalTo(view)
             $0.bottom.equalTo(view.safeAreaLayoutGuide)
             $0.height.equalTo(view).multipliedBy(0.1)
         }
         */
        
        [headerBox, bodyBox].forEach {
            view.addSubview($0)
        }
        
        [musicImageView, musicTitleLabel, artistNameLabel].forEach {
            headerBox.addSubview($0)
        }
        
        [albumImage, middleBar, lyricBox].forEach {
            
            bodyBox.addSubview($0)
        }
        
        [heartButton, heartLabel, similarButton, instagramButton].forEach {
            middleBar.addSubview($0)
        }
        
        lyricBox.addSubview(lyricLabel)
        
        
        
        setConstraints()
    }
    
    func setConstraints() {
        
        headerBox.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.width.equalTo(view).multipliedBy(0.9)
            $0.height.equalTo(50)
        }
        
        bodyBox.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(view)
            $0.width.equalTo(view).multipliedBy(0.85)
            $0.height.equalTo(view).multipliedBy(0.6)
        }
        
        musicTitleLabel.snp.makeConstraints {
            $0.top.equalTo(headerBox)
            $0.centerX.equalTo(headerBox)
        }
        musicImageView.snp.makeConstraints {
            $0.trailing.equalTo(musicTitleLabel.snp.leading).offset(-5)
            $0.centerY.equalTo(musicTitleLabel)
        }
        
        artistNameLabel.snp.makeConstraints {
            $0.centerX.equalTo(headerBox)
            $0.top.equalTo(musicTitleLabel.snp.bottom).offset(5)
        }
        
        albumImage.snp.makeConstraints {
            $0.top.equalTo(bodyBox)
            $0.leading.equalTo(bodyBox)
            $0.trailing.equalTo(bodyBox)
            $0.height.equalTo(bodyBox.snp.width)
        }
        
        middleBar.snp.makeConstraints {
            $0.trailing.equalTo(bodyBox)
            $0.leading.equalTo(bodyBox)
            $0.top.equalTo(albumImage.snp.bottom).offset(10)
            $0.height.equalTo(30)
        }
        
        heartButton.snp.makeConstraints {
            $0.leading.equalTo(middleBar)
            $0.centerY.equalTo(middleBar)
        }
        
        heartLabel.snp.makeConstraints {
            $0.leading.equalTo(heartButton.snp.trailing).offset(5)
            $0.centerY.equalTo(middleBar)
        }
        
        instagramButton.snp.makeConstraints {
            $0.trailing.equalTo(middleBar.snp.trailing)
            $0.centerY.equalTo(middleBar)
        }
        
        similarButton.snp.makeConstraints {
            $0.trailing.equalTo(instagramButton.snp.leading).offset(-5)
            $0.centerY.equalTo(middleBar)
            $0.height.equalTo(15)
        }
        
        lyricBox.snp.makeConstraints {
            $0.top.equalTo(middleBar.snp.bottom)
            $0.bottom.equalTo(bodyBox.snp.bottom)
            $0.leading.equalTo(bodyBox.snp.leading)
            $0.trailing.equalTo(bodyBox.snp.trailing)
        }
        
        lyricLabel.snp.makeConstraints{
            $0.centerY.equalTo(lyricBox)
            $0.centerX.equalTo(lyricBox)
        }
        
        
    }

}

