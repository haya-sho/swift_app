//
//  balanceTableViewController.swift
//  swift_challenge
//
//  Created by user on 2023/06/13.
//

import UIKit

class balanceTableViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    var getplusCost = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = getplusCost
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
