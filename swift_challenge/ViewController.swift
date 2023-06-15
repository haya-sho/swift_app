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
    //残高のラベル
    @IBOutlet weak var sumBalance: UILabel!
    
    //コストのインプットフォーム
    @IBOutlet weak var inputCost: UITextField!
    //項目のインプットフォーム
    @IBOutlet weak var inputItem: UITextField!
    
    var lastBalance:[[String: Any]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //書式をここに書く
        inputCost.textColor = UIColor.black
        inputItem.textColor = UIColor.black
        inputCost.keyboardType = UIKeyboardType.numberPad
        
        
        
        
    }

    
    
    //増やすボタンを押した時のアクション
    @IBAction func plusMoney(_ sender: Any) {
        //costとItemが両方記入されている時のみデータをappendする
        if  let inCotx = inputCost.text, !inCotx.isEmpty,
            let inIttx = inputItem.text, !inIttx.isEmpty{
            //UserDefaultsのchoboというキーに保存していく・・・{"chobo":[{},{},{}]}
            var chobo = UserDefaults.standard.array(forKey: "chobo")as? [[String: Any]] ?? []
            //保存するデータを記載
            //配列が空なら配列を作る&新しいデータをsetする
            let newData = ["cost":inCotx,"item":inIttx,"imageName":"plus"]as [String:Any]
            //choboにんアペンドする
            chobo.append(newData)
            // 更新されたデータをUserDefaultsに保存する
            UserDefaults.standard.set(chobo, forKey: "chobo")
            
            
            
            
            
            //            //残高計算
            //            // numにtextFieldに入力された数字を入れる
            //                    guard let num = Int(inputCost.text!) else {
            //                        return
            //                    }
            //            // sumTextにnumの数字を入れて、sumTextに入れる。
            //            let startText:Int = 0
            //            let sumText:Int
            //
            //            if String(startText) != UserDefaults.standard.array(forKey: "sum") as! String{
            //                sumText = Int(lastBalance) + num
            //            }else{
            //                sumText = startText + num
            //            }
            //            // UserDefaultsにaTextの値をtextKeyで保存する
            //                    UserDefaults.standard.set(String(sumText), forKey: "sum")
            //            //残高に表示させる
            //            sumBalance.text = String(sumText)
            //
            //        }
            
            
        }
    }
    
    //減らすボタンを押した時のアクション
    @IBAction func minusMoney(_ sender: Any) {
        //costとItemが両方記入されている時のみデータをappendする
        if  let inCotx = inputCost.text, !inCotx.isEmpty,
            let inIttx = inputItem.text, !inIttx.isEmpty{
            //UserDefaultsのchoboというキーに保存していく・・・{"chobo":[{},{},{}]}
            var chobo = UserDefaults.standard.array(forKey: "chobo")as? [[String: Any]] ?? []
            //保存するデータを記載
            //配列が空なら配列を作る&新しいデータをsetする
            let newData = ["cost":inCotx,"item":inIttx,"imageName":"minus"]as [String:Any]
            //choboにんアペンドする
            chobo.append(newData)
       
            // 更新されたデータをUserDefaultsに保存する
            UserDefaults.standard.set(chobo, forKey: "chobo")
            
//            //残高計算
//            // numにtextFieldに入力された数字を入れる
//                    guard let num = Int(inputCost.text!) else {
//                        return
//                    }
//            // sumTextにnumの数字を入れて、sumTextに入れる。
//                    sumText = sumText - num
//            // UserDefaultsにaTextの値をtextKeyで保存する
//                    UserDefaults.standard.set(String(sumText), forKey: "sum")
//            print(sumText)
//            //残高に表示させる
//            sumBalance.text = String(sumText)
//
//
//
//
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
