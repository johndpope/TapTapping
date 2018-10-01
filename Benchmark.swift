//
//  Benchmark.swift
//  TapTap-iOS
//
//  Created by chi on 2018/09/16.
//  Copyright © 2018年 新宅　千晶. All rights reserved.
//

import Foundation

class Benchmark {
    
    // 開始時刻を保存する変数
    var startTime: NSDate
    var key: String
    var resultTime: String
    
    // 処理開始
    init(key: String) {
        self.startTime = NSDate()
        self.key = key
        self.resultTime = ""
    }
    
    // 処理終了
    func finish() {
        let elapsed = NSDate().timeIntervalSince(self.startTime as Date) as Double
        let formatedElapsed = String(format: "%.3f", elapsed)
//        resultTime = String(formatedElapsed) + "秒"
//        print("Benchmark: \(key), Elasped time: \(formatedElapsed)(s)")
        resultTime = String(formatedElapsed)
//        print("\(formatedElapsed)(秒)")
    }
    
    // 処理をブロックで受け取る
    class func measure(key: String, block: () -> ()) {
        let benchmark = Benchmark(key: key)
        block()
        benchmark.finish()
    }
}
