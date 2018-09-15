//
//  GameViewController.swift
//  TapTap-iOS
//
//  Created by chi on 2018/08/12.
//  Copyright © 2018年 新宅　千晶. All rights reserved.
//

import UIKit
import AVFoundation


class GameViewController: UIViewController {
    
//    extension Array {
//        func sample()->Element {
//            // return self[Int(arc4random()) % self.count]
//            return self[Int(arc4random_uniform(UInt32(showCount.count)))]
//        }
//    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var rLabel: UILabel!
    @IBOutlet weak var lLabel: UILabel!
    
    var leftNum: Int = 0
    var rightNum: Int = 0
//    var showCount: Double?
    
    let showCount = [1, 2, 3, 4, 5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        scoreLabel.text = ""
        rLabel.text = "0"
        lLabel.text = "0"
        
        leftNum = Int(arc4random_uniform(50))
        rightNum = Int(arc4random_uniform(50))
        
//        print(showCount[Int(arc4random()) % showCount.count])
//        let timeInterval = showCount[Int(arc4random()) % showCount.count]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func startTimer() {
        
    }
    
    @objc func showNum() {
        rLabel.text = String(rightNum)
        lLabel.text = String(leftNum)
    }
    
    /*
     ラベルを表示するまでのランダムな間隔を設定、ラベルに表示する数字も用意
     
     スタートボタン押下で、タイマースタート。　設定した間隔でラベルに数字を表示、マイランキングとタイトルボタンを消す
     
     数字がラベルに表示されたらカウント開始
     
     ラベルがタップされたらタイムを表示
     */
    
    
    @IBAction func oStartButton(_ sender: Any) {
        startSound.currentTime = 0
        startSound.play()
        let timeInterval = showCount[Int(arc4random()) % showCount.count]
        Timer.scheduledTimer(timeInterval: TimeInterval(timeInterval), target: self, selector: #selector(GameViewController.showNum), userInfo: nil, repeats: true)
    }
    
    @IBAction func oRunkingButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Ranking", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "RankingViewController")
        self.present(nextView, animated: true, completion: nil)
    }
    
    @IBAction func oTitleButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
//        let storyboard: UIStoryboard = UIStoryboard(name: "Title", bundle: nil)
//        let nextView = storyboard.instantiateViewController(withIdentifier: "TitleViewController")
//        self.present(nextView, animated: true, completion: nil)
    }
    
}
