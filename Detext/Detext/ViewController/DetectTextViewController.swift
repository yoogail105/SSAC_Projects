//
//  DetectTextViewController.swift
//  Detext
//
//  Created by minjoohehe on 2021/10/27.
//

import UIKit
import Alamofire
import SwiftyJSON

class DetectTextViewController: UIViewController {
    @IBOutlet weak var targetImage: UIImageView!
    @IBOutlet weak var detextButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    //   static var detectedString = ""
    
    var detectedTextSet: [String] = ["문자는"]
    var resultString = ""
    //    {
    //        didSet {
    //            resultLabel.text = resultString
    //        }
    //    }
    //  MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    } //: VIEWDIDLOAD
    
    func setUI() {
        targetImage.layer.cornerRadius = 10
        detextButton.layer.cornerRadius = 10
        resultLabel.clipsToBounds = true
        resultLabel.layer.cornerRadius = 10
        resultLabel.text = ""
        
    }
    
    @IBAction func detextButtonClicked(_ sender: UIButton) {
        
        OCRAPIManager.shared.fetchOCRData(image: targetImage.image!) { code, resultString in
            //            print("VC: \(resultString)")
            self.resultLabel.text = resultString
        }
        //        print(#function)
        //        print(self.resultString)
    }
}
