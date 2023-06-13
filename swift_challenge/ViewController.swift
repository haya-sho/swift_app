//
//  ViewController.swift
//  swift_challenge
//
//  Created by user on 2023/06/12.
//

import UIKit

//テーブルデータ操作のために、UITableViewDelegate, UITableViewDataSourceを追加
class ViewController: UIViewController {
    @IBOutlet weak var plusMoney: UIButton!
    @IBOutlet weak var minusMoney: UIButton!
    
    @IBOutlet weak var inputCost: UITextField!
    
    var outputCost: String = ""
    
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    
    //記入したものを送り出す
    override func prepare (for segue:UIStoryboardSegue,sender:Any?){
        if segue.identifier == "plusGo"{
            let destinationVC = segue.destination as! balanceTableViewController
            destinationVC.getplusCost = inputCost.text!
        }
    }
    
    



    
    @IBAction func fixedCost(_ sender: Any) {
        let vc = fixedCostViewController()
                navigationController?.pushViewController(vc, animated: true)
        
    }
   
    

    

    
}
