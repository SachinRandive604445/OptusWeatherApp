//
//  OWColorExtention.swift
//  OptusWeatherApp
//
//  Created by Sachin on 17/12/20.
//  Copyright © 2020 Sachin. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static let navigationBarColor =  UIColor(red: 204.0/255.0, green: 114.0/255.0, blue: 27.0/255.0, alpha: 1.0)
    static let colorTop =  UIColor(red: 189.0/255.0, green: 113.0/255.0, blue: 45.0/255.0, alpha: 1.0).cgColor
    static let colorBottom = UIColor(red:219.0/255.0, green: 154.0/255.0, blue:77.0/255.0, alpha: 1.0).cgColor
}

extension UIViewController {
    func setGradientBackground(gradientLayer: CAGradientLayer) {
        gradientLayer.colors = [UIColor.colorTop, UIColor.colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}


