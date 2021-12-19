//
//  ProfileViewController.swift
//  SnapKitProject01
//
//  Created by 성민주민주 on 2021/12/19.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "whiteChristmas.jpg")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let darkView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.3
        return view
    }()
    
    let closeButton: WhiteButton = {
       let button = WhiteButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        return button
    }()
    
    
    let headerStackView: StackView = {
        let stackView = StackView()
  
        return stackView
    }()
    
    let giftButton: WhiteButton = {
        let button = WhiteButton()
        let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .thin, scale: .default)
        let image = UIImage(systemName: "gift.circle", withConfiguration: config)
        button.setImage(image, for: .normal)
        return button
    }()
    
    let diceButton: WhiteButton = {
        let button = WhiteButton()
        let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .thin, scale: .default)
        let image = UIImage(systemName: "die.face.5", withConfiguration: config)
        button.setImage(image, for: .normal)
        return button
    }()
    
    let settingButton: WhiteButton = {
        let button = WhiteButton()
        let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .thin, scale: .default)
        let image = UIImage(systemName: "gearshape.circle", withConfiguration: config)
        button.setImage(image, for: .normal)
        return button
    }()
    
    let profileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "iuSong")
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let profileNameLabel: UILabel = {
        let label = UILabel()
        label.text = "dlwlrma"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()

    
    let profileMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "strawberry moon 🙌"
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = .white
        return label
    }()
    
    //let path =  UIBezierPath()
    
    let bottomStackView: StackView = {
        let stackView = StackView()
      //  stackView.backgroundColor = .lightGray
        return stackView
    }()
    
    /*
     configuration.attributedTitle = AttributedString("Ascending Order", attributes: container)
     configuration.image = UIImage(systemName: "arrow.down.to.line")
     // 1
     configuration.imagePlacement = .trailing

     let button = UIButton(configuration: configuration, primaryAction: nil)
     */
    let chatMyselfButton: UIButton = {
        var button = UIButton()
        button = button.ProfileBottonButton(title: "나와의 채팅", image: "bubble.left.fill")
        return button
    }()
    
    let editProfileButton: UIButton = {
        var button = UIButton()
        button = button.ProfileBottonButton(title: "프로필 편집", image: "pencil")
        return button
    }()
    
    let kakaoStoryButton: UIButton = {
        var button = UIButton()
        button = button.ProfileBottonButton(title: "카카오스토리", image: "paperplane.fill")
        return button
    }()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        [backgroundImageView, darkView, closeButton, headerStackView, bottomStackView, profileStackView].forEach {
            view.addSubview($0)
        }
        
        [giftButton, diceButton, settingButton].forEach {
            headerStackView.addArrangedSubview($0)
        }
        
        [chatMyselfButton, editProfileButton, kakaoStoryButton].forEach{
            bottomStackView.addArrangedSubview($0)
        }
        
        [profileImageView, profileNameLabel, profileMessageLabel].forEach {
            profileStackView.addArrangedSubview($0)
        }
        
        setConfiguration()
        
    }
    
    func setConfiguration() {
        
        backgroundImageView.snp.makeConstraints {
            $0.trailing.equalTo(view)
            $0.leading.equalTo(view)
            $0.top.equalTo(view)
            $0.bottom.equalTo(view)
        }
        
        darkView.snp.makeConstraints {
            $0.trailing.equalTo(view)
            $0.leading.equalTo(view)
            $0.top.equalTo(view)
            $0.bottom.equalTo(view)
        }
        
        closeButton.snp.makeConstraints {
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
        headerStackView.snp.makeConstraints {
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-20)
            $0.centerY.equalTo(closeButton.snp.centerY)
            $0.width.equalTo(100)
            $0.height.equalTo(30)
        }
        
        bottomStackView.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.bottom.equalTo(view.snp.bottom).offset(-40)
            $0.height.equalTo(100)
            $0.leading.equalTo(view.snp.leading).offset(50)
            $0.trailing.equalTo(view.snp.trailing).offset(-50)
            
        }
        
        profileImageView.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.width.equalTo(100)
        }
        
        profileStackView.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.bottom.equalTo(bottomStackView.snp.top).offset(-20)
        }
    }
}
