//
//  DatabaseManager.swift
//  OptusWeatherApp
//
//  Created by Sachin on 17/12/20.
//  Copyright © 2020 Sachin. All rights reserved.
//

import Foundation
import RealmSwift

class DatabaseManager {
    private var database:Realm
    static let sharedInstance = DatabaseManager()
    
    private init() {
        database = try! Realm()
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    // Get all Reocrds
    func getCityInfoDataFromDB() -> Results<NewCityInfoModel> {
        let results: Results<NewCityInfoModel> = database.objects(NewCityInfoModel.self)
        return results
    }
    
    // Add new Record
    func addCityInfoData(object: NewCityInfoModel) {
        try! database.write {
            database.add(object)
        }
    }
    
    // Check recoed exist
    func searchNameIfExistInDatabase(id: String) -> NewCityInfoModel? {
        let predicate = NSPredicate(format: "id = %@", id )
        let nameObject = database.objects(NewCityInfoModel.self).filter(predicate).first
        if nameObject?.id == id {
            return nameObject
        }
        return nil
    }
}
