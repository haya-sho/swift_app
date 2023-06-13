//
//  plusMoneyViewController.swift
//  swift_challenge
//
//  Created by user on 2023/06/12.
//

import UIKit

class plusMoneyViewController: UIViewController {
    
    //増額するコメントを変数として宣言
    @IBOutlet weak var plusItem: UITextField!
    //増額する金額を変数として宣言
    @IBOutlet weak var plusCost: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func sendPlusData(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
     
        }
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
