//
//  LocalizabeleStrings.swift
//  SixDiary
//
//  Created by minjoohehe on 2021/11/01.
//

import Foundation

enum  LocalizableStrings: String {
    case welcome_text
    case data_backup
    case restore
    
    var localized: String {
        return self.rawValue.localized()
    }

    
    var localizedSetting: String {
        return self.rawValue.localized(tableName: "Setting")
    }
    
}
