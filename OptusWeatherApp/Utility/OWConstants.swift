//
//  OWConstants.swift
//  OptusWeatherApp
//
//  Created by Sachin on 17/12/20.
//  Copyright © 2020 Sachin. All rights reserved.
//

import Foundation

// CellIdentifier
enum CellIdentifiers {
    static let cityWeatherTableViewCell = "cityWeatherTableViewCell"
    static let cityListTableCell = "cityListTableCell"
    static let DetailWeatherInfoCell = "DetailWeatherInfoCell"
}

struct OWConstants {
    static let UNIT = "metric"
    static let MelbourneID = "2158177"
    static let Melbourne = "Melbourne"
    static let SydneyID = "2147714"
    static let Sydney = "Sydney"
    static let BrisbaneID = "2174003"
    static let Brisbane = "Brisbane"
    static let sucessMessage = "City Added Successfully!!!"
    static let alreadyExist = "City alreay exist in  database"
    static let success = "Success"
    static let Error = "Error"
    static let errorMessage = "Fail to load data from server. Please try after sometime."
    static let tableCityWeatherTableView = "table--cityWeatherTableView"
    static let addNewCityBtn = "addNewCityBtn"
    static let AddNewCity_Dashboard = "AddNewCity_Dashboard"
    static let searchBarIndentifier = "SearchBar"
}
