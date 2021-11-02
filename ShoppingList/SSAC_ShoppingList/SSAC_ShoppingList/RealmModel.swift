//
//  UserShoppingList.swift
//  SSAC_ShoppingList
//
//  Created by minjoohehe on 2021/11/02.
//

// @Persisted: column

/*
 struct ShoppingListModel {
     var shoppingContent: String
     var isChecked: Bool
     var isStar: Bool
 }*/

import Foundation
import RealmSwift

class UserShoppingList: Object {
    
    @Persisted var shoppingContent: String
    @Persisted var isChecked: Bool
    @Persisted var isStar: Bool
    
    @Persisted(primaryKey: true) var _id: ObjectId
    convenience init(shoppingContent: String, isChecked: Bool, isStar: Bool) {
        self.init()
        
        self.shoppingContent = shoppingContent
        self.isChecked = false
        self.isStar = false
    }
}
