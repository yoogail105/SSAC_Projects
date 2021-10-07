//
//  BoardViewController.swift
//  SSAC_LEDBoard
//
//  Created by minjoohehe on 2021/10/05.
//

import UIKit
import MarqueeLabel

class BoardViewController: UIViewController {

    // MARK: - PROPERTIES
    
    @IBOutlet var slideUIView: UIView!
    @IBOutlet var contentTextFeild: UITextField!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var colorButton: UIButton!
    //@IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var resultLabel: MarqueeLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewUISetting()
        resultLabelSetting()
        
    }
    
    func viewUISetting() {
        slideUIView.layer.cornerRadius = 10
        
        //UITextField outline 없애기
        contentTextFeild.borderStyle = .none
        contentTextFeild.backgroundColor = .white
        contentTextFeild.placeholder = "텍스트를 입력해 주세요."
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.backgroundColor = .white
        sendButton.layer.borderWidth = 2
        sendButton.layer.cornerRadius = 10
        sendButton.setTitle("보내기", for: .normal)
        sendButton.tintColor = .black
        // UIButton 글자 패딩 넣기
        sendButton.titleEdgeInsets  = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)

        colorButton.layer.cornerRadius = 10
        colorButton.setTitle("Aa", for: .normal)
        colorButton.tintColor = .red
        colorButton.layer.borderWidth = 2
        
    
    }
    
    func resultLabelSetting() {
        //resultLabel.textColor = .yellow
        resultLabel.textAlignment = .center
        resultLabel.font = .systemFont(ofSize: 250)
        //resultLabel.adjustsFontSizeToFitWidth = true
        //resultLabel.numberOfLines = 1
        resultLabel.minimumScaleFactor = 0.5
        
    }

    @IBAction func sendButtonClicked(_ sender: UITextField) {
        
        resultLabel.text = contentTextFeild.text
        resultLabel.speed = .duration(20) //느림
        
    }
    
    // ReturnKey 누르면 전광판의 글씨 업데이트
    @IBAction func returnKeyClicked(_ sender: UITextField) {
        sendButtonClicked(contentTextFeild)
    }
    
    // 탭 제스처로 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        var upperViewIsHidden = false
        
        self.view.endEditing(true)
        if slideUIView.isHidden {
            upperViewIsHidden = false
        } else {
            upperViewIsHidden = true
        }
        slideUIView.isHidden = upperViewIsHidden

   }


    @IBAction func colorChange(_ sender: UIButton) {
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        
        let randomColor = UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
        
        resultLabel.textColor = randomColor
    }
    
    
}
