//
//  ViewController.swift
//  swift_challenge
//
//  Created by user on 2023/06/12.
//

import UIKit

//テーブルデータ操作のために、UITableViewDelegate, UITableViewDataSourceを追加
class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
//
//    var data = [
//        ["日付","祝・休日"],
//        ["2021/01/01","元日"],
//        ["2021/01/11","成人の日"],
//        ["2021/02/11","建国記念の日"],
//        ["2021/02/23","天皇誕生日"],
//    ]
//
//
//    // 追加③：セルの個数を指定するデリゲートメソッド（必須）
//       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//           return data.count;
//       }
//       // 追加④：セルに値を設定するデータソースメソッド（必須）
//       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//           // セルを取得する
//           let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//           // TableViewCellの中に配置したLabelを取得する
//           let label1 = cell.contentView.viewWithTag(1) as! UILabel
//           let label2 = cell.contentView.viewWithTag(2) as! UILabel
//
//           // Labelにテキストを設定する
//           label1.text = data[indexPath.row][0]
//           label2.text = data[indexPath.row][1]
//
//           return cell
//       }
    //残高のテキストが表示される場所

    //増やすボタンを押したら画面が遷移するようにする
    @IBAction func plusMoney(_ sender: Any) {
        
        let vc = plusMoneyViewController()
                navigationController?.pushViewController(vc, animated: true)
    }
    //減らすボタンを押したら画面が遷移するようにする
    @IBAction func minusMoney(_ sender: Any) {
        let vc = minusMoneyViewController()
                navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func fixedCost(_ sender: Any) {
        let vc = fixedCostViewController()
                navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func outputAllTable(_ sender: Any) {
        self.performSegue(withIdentifier: "toAll", sender: nil)
        
        
    }
    
 
        

    
    
    
    
}
