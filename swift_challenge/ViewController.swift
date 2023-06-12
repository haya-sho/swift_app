//
//  ViewController.swift
//  swift_challenge
//
//  Created by user on 2023/06/12.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func plusMoney(_ sender: Any) {
        
        let vc = plusMoneyViewController()
                navigationController?.pushViewController(vc, animated: true)
        
        
    }
    @IBAction func minusMoney(_ sender: Any) {
        let vc = minusMoneyViewController()
                navigationController?.pushViewController(vc, animated: true)
        
     
    }
    
    
}
