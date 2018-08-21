//
//  GameViewController.swift
//  TapTap-iOS
//
//  Created by chi on 2018/08/12.
//  Copyright © 2018年 新宅　千晶. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var rLabel: UILabel!
    @IBOutlet weak var lLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func oStartButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func oRunkingButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Ranking", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "RankingViewController")
        self.present(nextView, animated: true, completion: nil)
//        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func oTitleButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Title", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "TitleViewController")
        self.present(nextView, animated: true, completion: nil)
//        self.dismiss(animated: true, completion: nil)
    }
    
}
