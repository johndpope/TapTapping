import UIKit
import Foundation
import AVFoundation
import SwiftyUserDefaults
import GoogleMobileAds
import Firebase

class GameViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var rLabel: UILabel!
    @IBOutlet weak var lLabel: UILabel!
    @IBOutlet weak var oRightButton: UIButton!
    @IBOutlet weak var oLeftButton: UIButton!
    @IBOutlet weak var oStartButton: UIButton!
    
    var rightNum: Int = 0
    var leftNum: Int = 0
    var startTime: Date!
    var myBenchMark: Benchmark?
    @IBOutlet weak var bannerView: GADBannerView!
    
    let showCount = [1, 2, 3, 4, 5]
    let appDataBase = AppDataBase.instance
    
    //MARK:- Override
    //    --------------------------------------------------------------------------------
    //    viewDidLoad()
    //    --------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
//        Defaults[.scoreRecord].removeAll()
//        print(Defaults[.scoreRecord])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scoreLabel.text = ""
        rLabel.text = "0"
        lLabel.text = "0"
        btnStateManager()
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
    }
    
    func judgment(myChoice: Int, singleNum: Int) {
        if myChoice > singleNum {
            stopSound.play()
            scoreLabel.textColor = UIColor.white
            scoreLabel.text = myBenchMark?.resultTime
            let resultString = myBenchMark!.resultTime
            let cast: Double = Double(resultString)!
            appDataBase.sortScore(cast)
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
        oStartButton.isEnabled = false
        scoreLabel.text = ""
        rLabel.text = "0"
        lLabel.text = "0"
        leftNum = Int(arc4random_uniform(50))
        rightNum = Int(arc4random_uniform(50))
        startSound.currentTime = 0
        startSound.play()
        let timeInterval = showCount[Int(arc4random()) % showCount.count]
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
        btnStateManager()
        oStartButton.isEnabled = true
    }
    
    @IBAction func oLeftButton(_ sender: Any) {
        myBenchMark?.finish()
        judgment(myChoice: leftNum, singleNum: rightNum)
        btnStateManager()
        oStartButton.isEnabled = true
    }
}
