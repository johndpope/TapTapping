//
//  GameViewController.swift
//  TapTap-iOS
//
//  Created by chi on 2018/08/12.
//  Copyright © 2018年 新宅　千晶. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var leftNum: Int = 0
    var rightNum: Int = 0
    var showCount: Double?

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var rLabel: UILabel!
    @IBOutlet weak var lLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        leftNum = Int(arc4random_uniform(50))
        rightNum = Int(arc4random_uniform(50))
        showCount = Double(arc4random_uniform(UInt32(5.00)))
//        print(showCount)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func startTimer() {
        
    }
    
    /*
     スタートボタン押下で、ラベルがラップされるまでのカウント開始
     
     マイランキングとタイトルボタンを消す
     
     カウントがラベルに表示されたらカウント開始
     
     ラベルがタップされたらタイムを表示
     */
    
    
    @IBAction func oStartButton(_ sender: Any) {
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
