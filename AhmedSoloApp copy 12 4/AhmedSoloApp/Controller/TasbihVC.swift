//
//  TasbihVC.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 25/04/1443 AH.
//

import Foundation
import UIKit

class TasbihVC: UIViewController {
    
    var currentCount : Int = 0
    @IBOutlet weak var Lablef: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Color")
        Lablef.layer.cornerRadius = 10
        Lablef.layer.masksToBounds = true
        
    }
    
    @IBAction func resetLable(_ sender: Any) {
        currentCount = 0
        Lablef.text = "0"
    }
    
    @IBAction func countLable(_ sender: Any) {
        currentCount += 1
        Lablef.text = "\(currentCount)"
    }
}
