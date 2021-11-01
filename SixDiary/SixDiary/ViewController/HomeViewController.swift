//
//  HomeViewController.swift
//  SixDiary
//
//  Created by minjoohehe on 2021/11/01.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
     
    

    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
   
        let contentSB = UIStoryboard(name: "Content", bundle: nil)
        guard let addVC = contentSB.instantiateViewController(withIdentifier: AddViewController.identifier) as? AddViewController else {
            print("Error")
            return
        }
        addVC.modalPresentationStyle = .fullScreen
        self.present(addVC, animated: true, completion: nil)
    }
}
