//
//  MemoTableViewController.swift
//  SSAC_Diary
//
//  Created by minjoohehe on 2021/10/12.
//

import UIKit

class MemoTableViewController: UITableViewController {
    // MARK: - PROPERTIES
    
    // Swift5.1 -> PropertyWrapper(@Environment)
    // list 앞에 감시자 달아주기
    var list: [String] = ["장 보기", "메모메모", "영화 보러 가기", "WWDC 시청하기"] {
        // 완벽하게 변화가 되었을 때 실행
        didSet {
            tableView.reloadData()
            // 달라지면! 감시자야 리로드 시켜!
        }
    }
    
    @IBOutlet weak var memoTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        // 배열에 텍스트뷰의 텍스트 값 추가
        
        if let text = memoTextView.text {
            //만약에 메모 텍스트뷰 값이 있다면 (nil아니면) Optional 해제된다.
            list.append(text)
            //갱신하는 코드 효율적으로 작성하기
            //tableView.reloadData()
            print(list)
        } else {
            print("빈 값이니 값을 적어주세요 alert 등")
        }
        
        
    }
    //테이블 뷰는 아웃렛 연결 하지 않는다.
    //테이블 뷰 필수 메서드
    
    //섹션의 수는 옵션: numberOfWections (default: 1)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    //옵션2: 섹션 타이틀: titleForheaderInSection
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "섹션 타이틀"
    }
    
    //1.필수:  셀의 갯수: numverOfRowsInSection
    
    //section을 선언없이 쓸 수 있는 이유: apple이 미리 지정해 두었기 때문에
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //        if section == 0 {
        //            return 2
        //        } else if section == 1 {
        //            return 4
        //        }
        return section == 0 ? 2 : list.count
    }
    
    //2.필수:  셀의 디자인 및 데이터 처리*****\
    // 재사용 메커니즘, 옵셔널 체이닝
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell") else {
            return UITableViewCell()
        }
        //
        //            // 비어있는 인스턴스 생성해서 반환한다.
        //            return UITableViewCell()
        //        }
        //
        

        
        if indexPath.section == 0 {
            print("cell")
            cell.textLabel?.text = "첫 번째 입니다. - \(indexPath)"
            cell.textLabel?.textColor = .brown
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)
        } else {
            
            //            if indexPath.row == 0 {
            //                cell?.textLabel?.text = list[indexPath.row]
            //            } else if indexPath.row == 1 {
            //                cell?.textLabel?.text = list[indexPath.row]
            //            } else if indexPath.row == 2 {
            //                cell?.textLabel?.text = list[indexPath.row]
            //            } else if indexPath.row == 3 {
            //                cell?.textLabel?.text = list[indexPath.row]
            //            } else {
            //                cell?.textLabel?.text = "데이터 없음"
            //            }
            //
            cell.textLabel?.text = list[indexPath.row]
            
            cell.textLabel?.textColor = .blue
            cell.textLabel?.font = .italicSystemFont(ofSize: 15)
        }
        
        
        // return cell!
        return cell
    }
    
    //3. (옵션이지만 하는게 나음)셀의 높이: heightForRowAt
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return indexPath.row == 0 ? 44 : 80
        //return indexPath.section == 0 ? 44 : 80
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 0 ? false : true
    }
    
    //(옵션) 셀 스와이프 ON canMoveRowAt: 스와이프 어떻게?
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.remove(at: indexPath.row)
            // tableView.reloadData()
        }
        
    }
    //테이블 뷰 갱신해야 하는 지점: 저장, 삭제
}
