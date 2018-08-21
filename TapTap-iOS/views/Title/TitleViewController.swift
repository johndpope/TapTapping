//
//  TitleViewController.swift
//  TapTap-iOS
//
//  Created by chi on 2018/08/12.
//  Copyright © 2018年 新宅　千晶. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func oGameButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Game", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "GameViewController")
        self.present(nextView, animated: true, completion: nil)
//        nextView.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func oRunkingButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Ranking", bundle: nil)
        let nextView = storyboard.instantiateViewController(withIdentifier: "RankingViewController")
        self.present(nextView, animated: true, completion: nil)
//        self.dismiss(animated: true, completion: nil)
    }
}
