//
//  UIString+Extension.swift
//  SixDiary
//
//  Created by minjoohehe on 2021/11/01.
//

import Foundation

extension String {
    var localized: String {
       return NSLocalizedString(self, comment: "")
    }
    
    func localized(tableName: String = "Localizaton") -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: .main, value: "", comment: "")
    }
}
