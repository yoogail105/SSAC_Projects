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
    
    // MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
    } //: VIEWDIDLOAD

    func setUI() {
        targetImage.layer.cornerRadius = 10
        detextButton.layer.cornerRadius = 10
        resultLabel.layer.cornerRadius = 10
        
    }

    @IBAction func detextButtonClicked(_ sender: UIButton) {
        
        OCRAPIManager.shared.fetchFaceData(image: targetImage.image!) { code, json in
            print(json)
        }
    }
    
}
