//
//  ShppingListTableViewController.swift
//  SSAC_ShoppingList
//
//  Created by minjoohehe on 2021/10/14.
//

import UIKit
import RealmSwift

class ShppingListTableViewController: UITableViewController {
    

    // MARK: - PROPERTIES
    
    let localRealm = try! Realm()
    var tasks: Results<UserShoppingList>!
    //Realm에서 읽어온 데이터를 UserShoppingLsit에 저장
    
    @IBOutlet weak var writeTextFiled: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet var shoppingLsitTableView: UITableView!
    @IBOutlet weak var addView: UIView!
    
    var shoppingList: [ShoppingListModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        tasks = localRealm.objects(UserShoppingList.self)
        print(tasks)
        print("Realm is located at:",localRealm.configuration.fileURL!)
        
        //배열에서 Realm데이터 가져오기
        tasks = localRealm.objects(UserShoppingList.self).sorted(byKeyPath: "shoppingContent", ascending: false)

    } //: VIEWDIDLOAD
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    func setUI() {
        writeTextFiled.backgroundColor = .clear
        writeTextFiled.borderStyle = .none
        addButton.layer.cornerRadius = 10
        addButton.clipsToBounds = true
        addView.layer.cornerRadius = 10
        addView.clipsToBounds = true
    }
    
    
    // MARK: - TABLE VIEW
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingListTableViewCell.identifier, for: indexPath) as? ShoppingListTableViewCell else {
            return UITableViewCell()
        }
        
        let row = tasks[indexPath.row]
        
        cell.shoppingListLabel.text = row.shoppingContent
        
        // 버튼 변경 처리
        if row.isChecked { //true이면
            cell.checkButton?.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            cell.checkButton?.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        
        if row.isStar { //true이면
            cell.starButton?.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            cell.starButton?.setImage(UIImage(systemName: "star"), for: .normal)
        }
        
        
        
        //UI
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 10
        cell.shoppingLisgInnerView.clipsToBounds = true
        cell.shoppingLisgInnerView.layer.cornerRadius = 10
        
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UIScreen.main.bounds.height / 12
    }
    
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        print(#function)
       // list.append(writeTextFiled.text)
        // optional 대응
        guard let shoppingContentText = writeTextFiled.text, shoppingContentText != "" else { return /* 아무것도 입력하지 않았을 때는 어떻게? */}
        
        // 등록시에는 즐찾,구매여부 모두 false 상태로 realm에 저장할 레코드 생성
        let task = UserShoppingList(shoppingContent: shoppingContentText, isChecked: false, isStar: false)
        try! localRealm.write {
            localRealm.add(task)
        }
        
        // 저장했으면 텍스트 필드 초기화
        writeTextFiled.text = ""
        tableView.reloadData()
    }
    
    /*xib cell 이용했을 경우에는 addTarget으로 구현한다.
     cell.starButton.addTarget() -> @objc func ~~
     */
    //-> 변경사항 어떻게 반영하는지..?
    @IBAction func checkButtonClicked(_ sender: UIButton) {
        print("checkButtonClicked")
        
        
    }
    
    @IBAction func starButtonClicked(_ sender: UIButton) {
        print("starButtonClicked")
    }
    
}
