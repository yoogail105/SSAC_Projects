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
    
    static var goalWater: Double {
        get {return UserDefaults.standard.double(forKey: "goalWater")}
        set {UserDefaults.standard.set(newValue, forKey: "goalWater")}
    }
    
    static var currentWater: Double {
        get {return UserDefaults.standard.double(forKey: "currentWater")}
        set {UserDefaults.standard.set(newValue, forKey: "currentWater")}
    }
    
    static var waterPercentage: Double {
        get {return UserDefaults.standard.double(forKey: "waterPercentage")}
        set {UserDefaults.standard.set(newValue, forKey: "waterPercentage")}
    }
}

