//
//  WebVC2.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 24/05/1443 AH.
//

import Foundation
import UIKit



class WebVC2 : UIViewController {
    
   
    
    @IBAction func webadd(_ sender: UIButton) {
        
        UIApplication.shared.open(URL(string: "https://zakaty.gov.sa/zakaty/about_zakaty")! as URL, options: [:], completionHandler: nil)
        
    }
    
    
    @IBAction func webadd22(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://zakaty.gov.sa/zakaty/zakat_in_islam")! as URL, options: [:], completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Color")
       
    }
}
