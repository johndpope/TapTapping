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
    
    //MARK:- override
    //    --------------------------------------------------------------------------------
    //    viewDidLoad()
    //    --------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.navigationController?.popViewController(animated: true)
        let leftBarButton = UIBarButtonItem(title: "<", style: .plain, target: self, action: #selector(RankingViewController.tappedLeftBarButton))
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func tappedLeftBarButton() {
        self.dismiss(animated: true, completion: nil)
//        let previousPage = PreviousViewController()
//        self.navigationController?.pushViewController(previousPage, animated: true)
    }

    //MARK:- delegate
    //    --------------------------------------------------------------------------------
    //    tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    //    --------------------------------------------------------------------------------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Defaults[.scoreRecord].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! RankingTableViewCell
        cell.backgroundColor = UIColor.clear
        cell.rankLabel?.text = rankNum[indexPath.row]
        let score = Defaults[.scoreRecord]
        cell.scoreLabel?.text = String(score[indexPath.row])
        return cell
    }
}
