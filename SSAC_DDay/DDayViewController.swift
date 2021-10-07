//
//  DDayViewController.swift
//  SSAC_DDay
//
//  Created by minjoohehe on 2021/10/08.
//

import UIKit

class DDayViewController: UIViewController {

    
    
    @IBOutlet var dateLabel01: UILabel!
    @IBOutlet var dateLabel02: UILabel!
    @IBOutlet var dateLabel03: UILabel!
    @IBOutlet var dateLabel04: UILabel!
    
    @IBOutlet var dDayImage01: UIImageView!
    @IBOutlet var dDayImage02: UIImageView!
    @IBOutlet var dDayImage03: UIImageView!
    @IBOutlet var dDayImage04: UIImageView!
    @IBOutlet var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //최소버전 13.0으로 내리면 동작 X, 14 이하는 알아서 automatic으로 동작
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        }
        
        dDayImageSettings(dDayImage01)
        dDayImageSettings(dDayImage02)
        dDayImageSettings(dDayImage03)
        dDayImageSettings(dDayImage04)
        dateLabelSettings(dateLabel01)
        dateLabelSettings(dateLabel02)
        dateLabelSettings(dateLabel03)
        dateLabelSettings(dateLabel04)
        
      
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        //DataFormatter 이용
        //.dateFormet: 날짜 형식 지정
        let format = DateFormatter()
        format.dateFormat = "yyyy년\nMM월 dd일"
        
        //날짜를 String으로 (sender:UIDatePicker의 date를 가져와서)
        let value = format.string(from: sender.date)
        print(value) //check
        
        
        // TimeInterval 사용
        
//        let afterDate100 = Date(timeInterval: 86400 * 100, since: sender.date)
//        dateLabel01.text = format.string(from: afterDate100)
//
        dateLabel01.text = format.string(from: Date(timeInterval: 86400 * 100, since: sender.date))
        dateLabel02.text = format.string(from: Date(timeInterval: 86400 * 200, since: sender.date))
        dateLabel03.text = format.string(from: Date(timeInterval: 86400 * 300, since: sender.date))
        dateLabel04.text = format.string(from: Date(timeInterval: 86400 * 400, since: sender.date))
        
        //문제점: 날짜 계산 -> 초단위를 버려야 함.
        
    }
    
    func dDayImageSettings(_ sender: UIImageView) {
     
        // shadow .. 왜 안되는 것... 안되는 이유: maskToBounds로 잘라내가 때문에 -> 그래서 containerView를 만들어봐도 안된다.
        
//        sender.layer.shadowOffset = CGSize(width: 0, height: 20)
//        sender.layer.shadowOpacity = 0.8
//        sender.layer.shadowRadius = 5
//        sender.layer.shadowColor = UIColor.black.cgColor
//
//
//        let shadowView = UIView()
//        shadowView.backgroundColor = UIColor.clear
//        shadowView.layer.shadowColor = UIColor.black.cgColor
//        shadowView.layer.shadowOffset = CGSize(width: 0, height: 20)
//        shadowView.layer.shadowOpacity = 0.8
//        shadowView.layer.shadowRadius = 5
//        shadowView.addSubview(sender)
//
       
        sender.layer.cornerRadius = 20
        sender.layer.masksToBounds = true
    
        
        
        //sender.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func dateLabelSettings(_ sender: UILabel) {
        sender.textAlignment = .center
        sender.text = title
        sender.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        
    }
    
    //오류메세지: Terminated due to signal 9
    // 

}
