//
//  model.swift
//  TapTap-iOS
//
//  Created by chi on 2018/08/22.
//  Copyright © 2018年 新宅　千晶. All rights reserved.
//
/*
 [*] 配列の要素が10あればリターン
 
 [] 10以下であれば値を配列に加える
 
 [] 昇順ソート
 
 [] 最後の値を削除
 */
import UIKit
import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    static let scoreRecord = DefaultsKey<[Double]>("scoreRecord")
}

final class model {
    
    fileprivate init() {
    }
    
    static let instance = model()
    
    func sortScore(_ score: Double) {
        if Defaults[.scoreRecord].count <= 9 {
            Defaults[.scoreRecord].append(score)
            Defaults[.scoreRecord].sort()
            Defaults[.scoreRecord].remove(at: 10)
        } else {
            Defaults[.scoreRecord].append(score)
            Defaults[.scoreRecord].sort()
        }
    }
    
}

