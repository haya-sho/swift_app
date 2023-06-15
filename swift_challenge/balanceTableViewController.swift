//
//  balanceTableViewController.swift
//  swift_challenge
//
//  Created by user on 2023/06/13.
//

import UIKit

class balanceTableViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var newplusItem: String?
    var newPlusCost: Int?
    
    //収支履歴のラベル
    @IBOutlet weak var rireki: UILabel!
    
    //テーブル
    @IBOutlet weak var allTable: UITableView!
 
    //データの削除ボタン
    @IBOutlet weak var allDelete: UIButton!
    
    
    //    //金額が表示されるラベル
//    @IBOutlet weak var costLabel: UILabel!
//    //項目が表示されるラベル
//    @IBOutlet weak var itemLabel: UILabel!
    
    
    //帳簿というUserDefauletsデータを宣言
    var chobo:[[String: Any]] = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allTable.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
       

        
//        allTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //帳簿というUserDefaultsデータを宣言
        chobo = UserDefaults.standard.array(forKey: "chobo")as? [[String: Any]] ?? []
        allTable.delegate = self
        allTable.dataSource = self
  
    }
    
    @IBAction func allDelete(_ sender: Any) {
//        帳簿をリセットする
        UserDefaults.standard.removeObject(forKey: "chobo")
        
        
    }
    
    
    
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

//        //CellのIDでUITαbleViewCellのインスタンスを作成
//
//        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath)
        
        //ラベルにデータをセットする
        
        // セルの背景色を設定
//           cell.backgroundColor = UIColor.gray
//
//        //普通のテキストなら入れることができる
//        let cellData = chobo[indexPath.row]
//        cell.textLabel?.text = (cellData["item"] as? String)

//        let cellData = chobo[indexPath.row]
//       if let Label1 = cell.viewWithTag(1) as? UILabel,
//            let Label2 = cell.viewWithTag(2) as? UILabel{
//
//           Label1.text = (cellData["item"] as? String)
//           if let cellCost = (cellData["cost"] as? Int){
//               Label2.text = String(cellCost)
//           }
////           Label1.textColor = UIColor.black
////           Label2.textColor = UIColor.black
       
            
//        return cell
//    }
    
    
}
