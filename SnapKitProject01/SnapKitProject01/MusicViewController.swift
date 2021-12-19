//
//  MusicViewController.swift
//  SnapKitProject01
//
//  Created by 성민주민주 on 2021/12/17.
//

import UIKit
import SnapKit

class MusicViewController: UIViewController {
    
    let headerBox: UIView = {
        let view = UIView()
        return view
    }()
    
    let bodyBox: UIView = {
        let view = UIView()
        return view
    }()
    
    let middleBar: UIView = {
        let view = UIView()
        return view
    }()
    
    let musicIconImageView: UIImageView = {
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
    
    let musicInfoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let musicDotButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        button.tintColor = .white
        return button
    }()
    
    // 아래로 향하는 화살표 Button
    // infoButton
    let albumImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "iuSong.jpeg")
        image.layer.cornerRadius = 5
        image.clipsToBounds = true
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
        button.tintColor = .lightGray
        return button
    }()
    
    let lyricBox: UIView = {
        let view = UIView()
        return view
    }()
    
    let lyricLabel: UILabel = {
        let label = UILabel()
        label.text = "달이 익어가니 서둘러 젊은 피야\n민들레 한 송이 들고"
        label.textColor = .lightGray
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textAlignment = .center
        return label
    }()
    
    let sliderBox: UIView = {
        let view = UIView()
        return view
    }()
    
    
    let repeatModeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "repeat"), for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    
    let progressView: UIProgressView = {
       let progressView = UIProgressView()
        progressView.progressTintColor = .green
        progressView.progress = 0.1
        return progressView
    }()
    
    let currentTime: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .green
        label.text = "0:04"
        return label
    }()

    let totalTime: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .darkGray
        label.text = "1:00"
        return label
    }()
    
    let shaffleModeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "shuffle"), for: .normal)
        button.tintColor = .lightGray
        return button
    }()
    
    
    let playerBox: UIView = {
        let view = UIView()
        return view
    }()
    
    let listButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .light, scale: .default)
        let image = UIImage(systemName: "line.3.horizontal", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        let config = UIImage.SymbolConfiguration(pointSize: 40, weight: .light, scale: .default)
        let image = UIImage(systemName: "backward.end.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        return button
    }()
    
    let pauseButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        let config = UIImage.SymbolConfiguration(pointSize: 40, weight: .light, scale: .default)
        let image = UIImage(systemName: "pause.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        return button
    }()
    
    let forwardButton: UIButton = {()
        let button = UIButton()
        button.tintColor = .white
        let config = UIImage.SymbolConfiguration(pointSize: 40, weight: .light, scale: .default)
        let image = UIImage(systemName: "forward.end.fill", withConfiguration: config)
        button.setImage(image, for: .normal)
        return button
    }()
    
    let soundButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .light, scale: .default)
        let image = UIImage(systemName: "speaker.wave.1", withConfiguration: config)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    
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
        
        [headerBox, bodyBox, sliderBox, playerBox].forEach {
            view.addSubview($0)
        }
        
        [musicIconImageView, musicTitleLabel, artistNameLabel, musicInfoButton, musicDotButton].forEach {
            headerBox.addSubview($0)
        }
        
        [albumImage, middleBar, lyricBox].forEach {
            
            bodyBox.addSubview($0)
        }
        
        [heartButton, heartLabel, similarButton, instagramButton].forEach {
            middleBar.addSubview($0)
        }
        
        lyricBox.addSubview(lyricLabel)
        
        [repeatModeButton, progressView, shaffleModeButton, currentTime, totalTime].forEach {
            sliderBox.addSubview($0)
        }
        
        [listButton, stackView, soundButton].forEach {
            playerBox.addSubview($0)
        }
        
        [backButton, pauseButton, forwardButton].forEach {
            stackView.addArrangedSubview($0)
        }
        
        
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
        musicIconImageView.snp.makeConstraints {
            $0.trailing.equalTo(musicTitleLabel.snp.leading).offset(-5)
            $0.centerY.equalTo(musicTitleLabel)
        }
    
        
        artistNameLabel.snp.makeConstraints {
            $0.centerX.equalTo(headerBox)
            $0.top.equalTo(musicTitleLabel.snp.bottom).offset(5)
        }
        
        musicInfoButton.snp.makeConstraints {
            $0.trailing.equalTo(headerBox.snp.trailing)
            $0.centerY.equalTo(musicTitleLabel.snp.centerY)
        }
        
        musicDotButton.snp.makeConstraints {
            $0.trailing.equalTo(headerBox.snp.trailing)
            $0.top.equalTo(musicInfoButton.snp.bottom).offset(10)
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
        
        sliderBox.snp.makeConstraints {
            $0.top.equalTo(bodyBox.snp.bottom)
            $0.bottom.equalTo(playerBox.snp.top)
            $0.leading.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        repeatModeButton.snp.makeConstraints {
            $0.leading.equalTo(sliderBox)
            $0.height.equalTo(sliderBox.snp.height)
            $0.width.equalTo(sliderBox.snp.height)
        }
        
        shaffleModeButton.snp.makeConstraints {
            $0.trailing.equalTo(sliderBox.snp.trailing)
            $0.height.equalTo(sliderBox.snp.height)
            $0.width.equalTo(sliderBox.snp.height)
        }
        
        progressView.snp.makeConstraints {
            $0.leading.equalTo(repeatModeButton.snp.trailing)
            $0.trailing.equalTo(shaffleModeButton.snp.leading)
            $0.centerY.equalTo(sliderBox.snp.centerY)
        }
        
        currentTime.snp.makeConstraints {
            $0.leading.equalTo(progressView.snp.leading)
            $0.top.equalTo(progressView.snp.bottom).offset(5)
        }
        
        
        totalTime.snp.makeConstraints {
            $0.trailing.equalTo(progressView.snp.trailing)
            $0.top.equalTo(progressView.snp.bottom).offset(5)
        }
        
        playerBox.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leadingMargin.equalTo(view)
            $0.trailingMargin.equalTo(view)
            $0.height.equalTo(60)
        }
        
        stackView.snp.makeConstraints {
            $0.centerX.equalTo(playerBox.snp.centerX)
            $0.width.equalTo(180)
            $0.height.equalTo(playerBox.snp.height)
        }
        
        listButton.snp.makeConstraints {
            $0.centerY.equalTo(playerBox.snp.centerY)
            $0.leading.equalTo(playerBox).offset(10)
        }
        
        soundButton.snp.makeConstraints {
            $0.centerY.equalTo(playerBox.snp.centerY)
            $0.trailing.equalTo(playerBox.snp.trailing).offset(-10)
        }

        
        
    }
    
}

