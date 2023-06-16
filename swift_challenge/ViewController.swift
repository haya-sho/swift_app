//
//  ViewController.swift
//  swift_challenge
//
//  Created by user on 2023/06/12.
//

import UIKit


//テーブルデータ操作のために、UITableViewDelegate, UITableViewDataSourceを追加
class ViewController: UIViewController, UITextFieldDelegate {
    //増やす、減らすボタン
    @IBOutlet weak var plusMoney: UIButton!
    @IBOutlet weak var minusMoney: UIButton!
    //残高のラベル
    @IBOutlet weak var sumBalance: UILabel!
    
    //コストのインプットフォーム
    @IBOutlet weak var inputCost: UITextField!
    //項目のインプットフォーム
    @IBOutlet weak var inputItem: UITextField!
    
 
    @IBOutlet weak var allDelete: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //書式をここに書く
        inputCost.textColor = UIColor.black
        inputItem.textColor = UIColor.black
//        inputCost.keyboardType = UIKeyboardType.numberPad
        

      

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
            
            //実行後はラベルの中身を消す
            inputCost.text = ""
            inputItem.text = ""
            
            //残高計算
            
            if let costNum = Int(inCotx){
                // sumTextにnumの数字を入れて、sumTextに入れる。
               
                let sumNum = UserDefaults.standard.integer(forKey: "sum")
                //sumというKeyに入っている文字列の合計値を抜き出す
                
                    let newNum = costNum + sumNum
                sumBalance.text = "\(newNum)"
                    print(newNum)
                    // UserDefaultsにsumNumの値をsumというKeyで保存する
                    UserDefaults.standard.set(newNum, forKey: "sum")
              
            }
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
            
            //実行後はラベルの中身を消す
            inputCost.text = ""
            inputItem.text = ""
            
            //残高計算
            
            if let costNum = Int(inCotx){
                // sumTextにnumの数字を入れて、sumTextに入れる。
               
                let sumNum = UserDefaults.standard.integer(forKey: "sum")
                //sumというKeyに入っている文字列の合計値を抜き出す
                
                    let newNum = sumNum - costNum
                sumBalance.text = "\(newNum)"
                    print(newNum)
                    // UserDefaultsにsumNumの値をsumというKeyで保存する
                    UserDefaults.standard.set(newNum, forKey: "sum")
              
            }
        }
        
        
        
        
        
    }
    
    @IBAction func allDelete(_ sender: Any) {
        // 確認メッセージを表示
            let alertController = UIAlertController(title: "確認", message: "帳簿の履歴を全て削除しますか？", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
            let resetAction = UIAlertAction(title: "削除", style: .destructive) { _ in
                
        //        帳簿をリセットする
        UserDefaults.standard.removeObject(forKey: "chobo")
        UserDefaults.standard.set(0, forKey: "sum")
                self.dismiss(animated: true, completion: nil)
                self.sumBalance.text = "0"
            }
              alertController.addAction(cancelAction)
              alertController.addAction(resetAction)
              present(alertController, animated: true, completion: nil)
        }
    
    


    
    @IBAction func fixedCost(_ sender: Any) {
        let vc = fixedCostViewController()
                navigationController?.pushViewController(vc, animated: true)
    }
}
    


 
