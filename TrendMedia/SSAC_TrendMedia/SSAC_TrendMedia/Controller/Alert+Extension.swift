//
//  Alert+Extension.swift
//  SSAC_TrendMedia
//
//  Created by minjoohehe on 2021/10/22.
//

import UIKit

extension UIViewController {

    // 얼럿을 호출하기 위해서는 함수명 이용
    func showAlert(title: String, message: String, okTitle: String, okAction: @escaping () -> ()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        //handler: 버튼 눌렀을 때 뭐 해줄래?
        let ok = UIAlertAction(title: okTitle, style:.default) { _ in //와일드카드
            print("확인 버튼 눌렀음")
            
            okAction()
            //함수 안에 함수 안에 함tn
        }
                
        alert.addAction(cancel)
        alert.addAction(ok)
        
        self.present(alert, animated: true) {
            //얼럿을 띄우고나서 뭘 하고 싶은지? 예를 들어 화면 전환이라던가.
            print("얼럿이 떴습니다.")
        }
        
    }
}

