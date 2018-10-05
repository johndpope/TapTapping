//
//  model.swift
//  TapTap-iOS
//
//  Created by chi on 2018/08/22.
//  Copyright © 2018年 新宅　千晶. All rights reserved.
//
import UIKit
import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    static let scoreRecord = DefaultsKey<[Double]>("scoreRecord")
}

final class AppDataBase {
    
    static let instance = AppDataBase()
    
    private init() {}
    
    func sortScore(_ newScore: Double) {
        if Defaults[.scoreRecord].count >= 10 {
            Defaults[.scoreRecord].append(newScore)
            Defaults[.scoreRecord].sort()
            Defaults[.scoreRecord].removeLast()
        } else {
            Defaults[.scoreRecord].append(newScore)
            Defaults[.scoreRecord].sort()
        }
    }
}

