//
//  PdfVC.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 07/05/1443 AH.
//

import Foundation
import WebKit



class PdfVC : UIViewController {
    
    
    
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "Quran", ofType: "pdf")
        let url = URL(fileURLWithPath: path!)
        let request = URLRequest(url: url)
        
        
        webView.load(request)
        
        
    }
}
