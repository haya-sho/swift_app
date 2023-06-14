//
//  ViewController.swift
//  swift_challenge
//
//  Created by user on 2023/06/12.
//

import UIKit

//テーブルデータ操作のために、UITableViewDelegate, UITableViewDataSourceを追加
class ViewController: UIViewController {
    //増やす、減らすボタン
    @IBOutlet weak var plusMoney: UIButton!
    @IBOutlet weak var minusMoney: UIButton!
    //コストのインプットフォーム
    @IBOutlet weak var inputCost: UITextField!
    //項目のインプットフォーム
    @IBOutlet weak var inputItem: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //書式をここに書く
        inputCost.textColor = UIColor.black
        inputItem.textColor = UIColor.black
    }

    
    
    
    @IBAction func plusMoney(_ sender: Any) {
        //costとItemが両方記入されている時のみデータをappendする
        if  let inCotx = inputCost.text, !inCotx.isEmpty,
            let inIttx = inputItem.text, !inIttx.isEmpty{
            //UserDefaultsのchoboというキーに保存していく・・・{"chobo":[{},{},{}]}
            var chobo = UserDefaults.standard.array(forKey: "chobo")as? [[String: Any]] ?? []
            //保存するデータを記載
            //配列が空なら配列を作る&新しいデータをsetする
            let newData = ["cost":inCotx,"item":inIttx,"PorM":""]as [String:Any]
            //choboにんアペンドする
            chobo.append(newData)
       
            // 更新されたデータをUserDefaultsに保存する
            UserDefaults.standard.set(chobo, forKey: "chobo")
           

             //テーブルを更新する
//            if let balanceVC = tabBarController?.viewControllers?[1] as? balanceTableViewController {
//                balanceVC.chobo = chobo
//                balanceVC.allTable.reloadData()

//
//            }
        }
    }


    
    @IBAction func fixedCost(_ sender: Any) {
        let vc = fixedCostViewController()
                navigationController?.pushViewController(vc, animated: true)
    }
}
    



//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "plusGo"{
//                  let destinationVC = segue.destination as! balanceTableViewController
//                  destinationVC.getplusCost = inputCost.text!
//            destinationVC.getplusItem = inputCost.text!
//        }
//      }
