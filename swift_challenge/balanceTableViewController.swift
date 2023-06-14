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
 
//    //金額が表示されるラベル
//    @IBOutlet weak var costLabel: UILabel!
//    //項目が表示されるラベル
//    @IBOutlet weak var itemLabel: UILabel!
    
    
    //帳簿というUserDefauletsデータを宣言
    var chobo:[[String: Any]] = []
    
//    var getplusCost = ""
//    var getplusItem = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allTable.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        //帳簿というUserDefaultsデータを宣言
        chobo = UserDefaults.standard.array(forKey: "chobo")as? [[String: Any]] ?? []
        allTable.delegate = self
        allTable.dataSource = self
        //一旦消去
//        UserDefaults.standard.removeObject(forKey: "chobo")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chobo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //CellのIDでUITαbleViewCellのインスタンスを作成
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell", for: indexPath)
        
        //ラベルにデータをセットする
        
        // セルの背景色を設定
           cell.backgroundColor = UIColor.gray
       
       if let Label1 = cell.viewWithTag(1) as? UILabel,
            let Label2 = cell.viewWithTag(2) as? UILabel{
           let cellData = chobo[indexPath.row]
          
           Label1.text = (cellData["item"] as? String)
           if let cellCost = (cellData["cost"] as? Int){
               Label2.text = String(cellCost)
           }
//           Label1.textColor = UIColor.black
//           Label2.textColor = UIColor.black
       }
            
        return cell
    }
    
    
}
