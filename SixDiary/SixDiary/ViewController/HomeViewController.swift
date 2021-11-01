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
        naviItem()
    }

    func naviItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(AddButtonClicked))
    }
    
    @objc func AddButtonClicked() {
        let contentSB = UIStoryboard(name: "Content", bundle: nil)
        guard let addVC = contentSB.instantiateViewController(withIdentifier: AddViewController.identifier) as? AddViewController else {
            print("Error")
            return
        }
        addVC.modalPresentationStyle = .fullScreen
        self.present(addVC, animated: true, completion: nil)
    }
    
    /*
    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        print("add Button Clicked")
    }
     */
}
