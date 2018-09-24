//
//  RankingViewController.swift
//  TapTap-iOS
//
//  Created by chi on 2018/08/12.
//  Copyright © 2018年 新宅　千晶. All rights reserved.
//

import UIKit
import SwiftyUserDefaults

class RankingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let rankNum: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        readDate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return rankNum.count
        return Defaults[.scoreRecord].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! RankingTableViewCell
        cell.backgroundColor = UIColor.clear
        cell.rankLabel?.text = rankNum[indexPath.row]
//        let test = Defaults[.scoreRecord]
//        let test = Defaults[.scoreRecord](repeating: 0, count: 9)
//        print(test)
//        let array = Defaults.scoreRecord(forKey: "scoreRecord") ?? [String]()
        let score = Defaults[.scoreRecord]
        cell.scoreLabel?.text = score[indexPath.row]
        //        print(UserDefaults.standard.dictionaryRepresentation().values)

        return cell
    }
}
