//
//  GameViewController.swift
//  TapTap-iOS
//
//  Created by chi on 2018/08/12.
//  Copyright © 2018年 新宅　千晶. All rights reserved.
//
/*
 1. [*] スタートボタンを押下でゲームを再スタートさせる
 
 2. [*] 少ない数をタップすると赤文字でアウトの表示
 
 3. [*] 少ない数をタップすると武ブーの効果音
 
 4. [*] 表示までのタイマーが暴走している　-> タイマーは数字が表示されたらリセット
 */

import UIKit
import AVFoundation


class GameViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var rLabel: UILabel!
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var oRightButton: UIButton!
    @IBOutlet weak var oLeftButton: UIButton!
    
    var rightNum: Int = 0
    var leftNum: Int = 0
    var startTime: Date!
    var myBenchMark: Benchmark?
    
    let showCount = [1, 2, 3, 4, 5]
    
    //MARK:- Override
    //    --------------------------------------------------------------------------------
    //    viewDidLoad()
    //    --------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        scoreLabel.text = ""
        rLabel.text = "0"
        lLabel.text = "0"
        
        btnStateManager()
        
//        leftNum = Int(arc4random_uniform(50))
//        rightNum = Int(arc4random_uniform(50))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:- Method
    //    --------------------------------------------------------------------------------
    //    showNum()
    //    --------------------------------------------------------------------------------
    @objc func showNum() {
        oRightButton.isHidden = false
        oLeftButton.isHidden = false
        rLabel.text = String(rightNum)
        lLabel.text = String(leftNum)
        myBenchMark = Benchmark(key: "showNum()")
        print("しょうナム")
    }
    
    func judgment(myChoice: Int, singleNum: Int) {
        if myChoice > singleNum {
            stopSound.play()
            scoreLabel.textColor = UIColor.white
            scoreLabel.text = myBenchMark?.resultTime
        } else {
            badSound.play()
            scoreLabel.textColor = UIColor.red
            scoreLabel.text = "アウト!!"
        }
    }
    
    func btnStateManager() {
        oRightButton.isHidden = true
        oLeftButton.isHidden = true
    }
    
    //MARK:- Action
    //    --------------------------------------------------------------------------------
    //    oStartButton(_ sender: Any)
    //    --------------------------------------------------------------------------------
    @IBAction func oStartButton(_ sender: Any) {
        btnStateManager()
//        oRightButton.isHidden = false
//        oLeftButton.isHidden = false
        scoreLabel.text = ""
        rLabel.text = "0"
        lLabel.text = "0"
        leftNum = Int(arc4random_uniform(50))
        rightNum = Int(arc4random_uniform(50))
        startSound.currentTime = 0
        startSound.play()
        let timeInterval = showCount[Int(arc4random()) % showCount.count]
        print(timeInterval)
        Timer.scheduledTimer(timeInterval: TimeInterval(timeInterval), target: self, selector: #selector(GameViewController.showNum), userInfo: nil, repeats: false)
    }
    
    @IBAction func oRunkingButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Ranking", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "RankingViewController")
        self.present(nextView, animated: true, completion: nil)
    }
    
    @IBAction func oTitleButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func oRightButton(_ sender: Any) {
        myBenchMark?.finish()
        judgment(myChoice: rightNum, singleNum: leftNum)
    }
    
    @IBAction func oLeftButton(_ sender: Any) {
        myBenchMark?.finish()
        judgment(myChoice: leftNum, singleNum: rightNum)
    }
    
}
