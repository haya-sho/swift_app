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
        
    }
    
    // コストのインプットフォームの入力が変更されたときに呼ばれるメソッド
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // コストの入力フォーマットを3桁ごとに区切る
        if textField == inputCost {
            // テキストフィールドの現在のテキストと入力されたテキストを結合
            let text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
            // 文字列を数値に変換
            if let cost = Int(text) {
                // 3桁ごとにカンマを追加してフォーマット
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                if let formattedText = formatter.string(from: NSNumber(value: cost)) {
                    // フォーマットされたテキストをテキストフィールドに表示
                    textField.text = formattedText
                }
            }
            // 入力が変更されたので、テキストフィールドに反映させないようにfalseを返す
            return false
        }
        // その他のテキストフィールドの場合は入力を許可
        return true
    }
    
    
    

    
    
    //増やすボタンを押した時のアクション
    @IBAction func plusMoney(_ sender: Any) {
        //costとItemが両方記入されている時のみデータをappendする
        if  let inCotx = inputCost.text, !inCotx.isEmpty,
            let inIttx = inputItem.text, !inIttx.isEmpty{
            //UserDefaultsのchoboというキーに保存していく・・・{"chobo":[{},{},{}]}
            var chobo = UserDefaults.standard.array(forKey: "chobo")as? [[String: Any]] ?? []
            //保存するデータを記載
            //日付を取得
            let currentDate = Date()
            
            //配列が空なら配列を作る&新しいデータをsetする
            let newData = ["cost":inCotx,"item":inIttx,"imageName":"plus","date": currentDate]as [String:Any]
            
            //choboにんアペンドする
            chobo.append(newData)
            // 更新されたデータをUserDefaultsに保存する
            UserDefaults.standard.set(chobo, forKey: "chobo")
            
            //実行後はラベルの中身を消す
            inputCost.text = ""
            inputItem.text = ""
        
            
            // 残高計算後にフォーマットを適用して表示
            if let costNum = Int(inCotx) {
                let sumNum = UserDefaults.standard.integer(forKey: "sum")
                let newNum = sumNum + costNum
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                if let formattedText = formatter.string(from: NSNumber(value: newNum)) {
                    sumBalance.text = formattedText
                }
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
            //日付を取得
            let currentDate = Date()
            
            //配列が空なら配列を作る&新しいデータをsetする
            let newData = ["cost":inCotx,"item":inIttx,"imageName":"minus","date": currentDate]as [String:Any]
            //choboにんアペンドする
            chobo.append(newData)
       
            // 更新されたデータをUserDefaultsに保存する
            UserDefaults.standard.set(chobo, forKey: "chobo")
            
            //実行後はラベルの中身を消す
            inputCost.text = ""
            inputItem.text = ""
            
            
            //残高計算////////////////////////////////////////
            
            
            // 残高計算後にフォーマットを適用して表示
            if let costNum = Int(inCotx) {
                let sumNum = UserDefaults.standard.integer(forKey: "sum")
                let newNum = sumNum - costNum
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                if let formattedText = formatter.string(from: NSNumber(value: newNum)) {
                    sumBalance.text = formattedText
                }
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
    


 
