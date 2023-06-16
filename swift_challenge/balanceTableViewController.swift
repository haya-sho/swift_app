//
//  balanceTableViewController.swift
//  swift_challenge
//
//  Created by user on 2023/06/13.
//

import UIKit

class balanceTableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
 
    //収支履歴のラベル
    @IBOutlet weak var rireki: UILabel!
    
    //テーブル
    @IBOutlet weak var allTable: UITableView!
 
    //データの削除ボタン
    @IBOutlet weak var allDelete: UIButton!
    
    
    //帳簿というUserDefauletsデータを宣言
    var chobo:[[String: Any]] = []
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allTable.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
       

        
//        allTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //帳簿というUserDefaultsデータを宣言
        chobo = UserDefaults.standard.array(forKey: "chobo")as? [[String: Any]] ?? []
        chobo.reverse()
        allTable.delegate = self
        allTable.dataSource = self
    
  
    }
    
//    @IBAction func allDelete(_ sender: Any) {
//        //        帳簿をリセットする
//        UserDefaults.standard.removeObject(forKey: "chobo")
//        UserDefaults.standard.set(0, forKey: "sum")
//        dismiss(animated: true, completion: nil)
//        
//            
//        }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chobo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell",for: indexPath) as! CustomTableViewCell
        let cellData = chobo[indexPath.row]
            cell.itemLabel.text = (cellData["item"] as? String)
        cell.costLabel.text = (cellData["cost"] as? String)
        
        if let imageName = cellData["imageName"] as? String {
            cell.iconImageView.image = UIImage(named: imageName)}else {
                cell.iconImageView.image = UIImage(named: "minus")
            }
        
        
        
            
            return cell
        }
        
}
