//
//  UserModel.swift
//  DrinkWater
//
//  Created by minjoohehe on 2021/10/11.
//

import UIKit

/*

@propertyWrapper
class UserDefault<T> {
    
    let key: String
    let defaultValue: T
    let storage: UserDefaults
    
    var wrappedValue: T {
        get { UserDefaults.standard.object(forKey: self.key) as? T ?? self.defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: self.key)}
    }
}

class UserManager {
    
    @UserDefault(key: "name", defaultValue: false)
    static var name: String
}
 */
    
class UserManager {
    
    static var name: String? {
        get {return UserDefaults.standard.string(forKey: "name")}
        set {UserDefaults.standard.set(newValue, forKey: "name")}
    }
    
    static var waterGoal: Int? {
        get {return UserDefaults.standard.integer(forKey: "waterGoal")}
        set {UserDefaults.standard.set(newValue, forKey: "waterGoal")}
    }
    
    static var drinkedWater: Int? {
        get {return UserDefaults.standard.integer(forKey: "drinkWater")}
        set {UserDefaults.standard.set(newValue, forKey: "drinkedWater")}
    }
    
    static var waterPercentage: Int? {
        get {return UserDefaults.standard.integer(forKey: "waterPercentage")}
        set {UserDefaults.standard.set(newValue, forKey: "waterPercentage")}
    }
}

