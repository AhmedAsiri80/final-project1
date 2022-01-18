//
//  GestureVC.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 09/05/1443 AH.
//

import Foundation
import UIKit

class gestureVC : UIViewController {
    
    
    @IBOutlet var rotationgesture: UIRotationGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func rotation(_ sender: Any) {
        guard let gestureview = rotationgesture.view else{
            return
        }
        gestureview.transform = gestureview.transform.rotated(by: rotationgesture.rotation)
        rotationgesture.rotation = 0
        
    }
}


