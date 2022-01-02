//
//  ViewController.swift
//  TodayBeer
//
//  Created by 성민주민주 on 2021/12/21.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerName: UILabel!
    @IBOutlet weak var beerTagline: UILabel!
    @IBOutlet weak var beerDescription: UILabel!
    @IBOutlet weak var beerFoodParing: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recommendBeer()
        
        
    }
    
    func recommendBeer() {
        BeerAPIManager.shared.fetchBeerData { result in
            
            let url = URL(string: "\(result.imageURL!)")
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.beerImage.image = UIImage(data: data!)
                }
                
            }
            
            self.beerName.text = result.name!
            self.beerTagline.text = result.tagline!
            self.beerDescription.text = result.description!
            let foodPairing = result.foodPairing?.joined()
            self.beerFoodParing.text = foodPairing!
            
        }
    }
    
    @IBAction func resetButtonClicked(_ sender: UIButton) {
        recommendBeer()
        
    }
    
    
}

