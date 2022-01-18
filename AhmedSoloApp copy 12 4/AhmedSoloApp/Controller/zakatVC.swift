//
//  zakatVC.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 20/05/1443 AH.
//

import Foundation
import UIKit

class ZakatVC: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var total: UITextField!
   

    
    @IBAction func caculate(_ sender: Any) {
        // 1- Know the minumem amount of money to accept zakah
        let minAmoutn = 0
        // 2- declear the nasap
        let nasap = 40
        var input = Int(total.text!) // change value from String to Int
        // 3- compare between user input and minum amount
        if input == nil {
            print("nil")
            label.text = ""
        } else {
            
            if input! <= minAmoutn {
                label.text = "ليس فيها زكاة"
            } else {
                var zakah =  input! / nasap
                label.text = "زكاتك تساوي \(zakah)"
            }
        }
       
    }
        
}

