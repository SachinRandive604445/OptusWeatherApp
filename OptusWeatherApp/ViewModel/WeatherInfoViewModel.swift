//
//  WeatherInfoViewModel.swift
//  OptusWeatherApp
//
//  Created by Sachin on 17/12/20.
//  Copyright © 2020 Sachin. All rights reserved.
//

import Foundation
import RealmSwift

protocol WeatherInfoViewModelProtocal {
    func didUpdateWeatherInfo()
    func didErrorDisplay()
}

class WeatherInfoViewModel: NSObject {
    var delegate: WeatherInfoViewModelProtocal?
    var weatherInfoList : [List]  = []
    
    //MARK: - CheckDataBaseFilesExist Methods
    fileprivate func CheckDBFilesExist() {
        let destPath = Realm.Configuration.defaultConfiguration.fileURL?.path
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: destPath!) {
            //File exist, do nothing
        } else {
            let firstCityInfoModel = NewCityInfoModel()
            firstCityInfoModel.id = OWConstants.SydneyID
            firstCityInfoModel.name = OWConstants.Sydney
            DatabaseManager.sharedInstance.addCityInfoData(object: firstCityInfoModel)
            let secondCityInfoModel = NewCityInfoModel()
            secondCityInfoModel.id = OWConstants.MelbourneID
            secondCityInfoModel.name = OWConstants.Melbourne
            DatabaseManager.sharedInstance.addCityInfoData(object: secondCityInfoModel)
            let thirdCityInfoModel = NewCityInfoModel()
            thirdCityInfoModel.id = OWConstants.BrisbaneID
            thirdCityInfoModel.name = OWConstants.Brisbane
            DatabaseManager.sharedInstance.addCityInfoData(object: thirdCityInfoModel)
        }
    }
    
    //MARK: - getEmployeeList Methods
    func getWeatherInfoList() {
        CheckDBFilesExist()
        let listOfCityInfo = DatabaseManager.sharedInstance.getCityInfoDataFromDB()
        let groupOfId = (listOfCityInfo.map{$0["id"] as! String}).joined(separator: ",")
        print(groupOfId)
        let urlString = OWAppConfig.BaseURL + OWAppConfig.group + "id=\(groupOfId)&units=\(OWConstants.UNIT)&APPID=\(OWAppConfig.API_KEY)"
        ServiceManager.shared.getWeatherInfo(urlString: urlString, completionHandler: { (result: Result<WeatherInfo?, NetworkError>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    guard let response = response  else {
                        self.delegate?.didErrorDisplay()
                        return
                    }
                    self.weatherInfoList = response.list
                    self.delegate?.didUpdateWeatherInfo()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                self.delegate?.didErrorDisplay()
            }
        })
    }
}
