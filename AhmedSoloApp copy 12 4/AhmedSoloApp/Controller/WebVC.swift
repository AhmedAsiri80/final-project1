//
//  WebVC.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 25/04/1443 AH.
//

import Foundation
import UIKit
import youtube_ios_player_helper
import SideMenu


class WebVC : UIViewController, YTPlayerViewDelegate {
    
    @IBOutlet weak var playtwo: YTPlayerView!
    @IBOutlet weak var playerVedio: YTPlayerView!
    // @IBOutlet weak var playerVedio3: YTPlayerView!
    
    @IBAction func webadd(_ sender: UIButton) {
        
        UIApplication.shared.open(URL(string: "https://ehsan.sa/?utm_source=GOOGLE&utm_medium=SEARCH&utm_campaign=ONGOING")! as URL, options: [:], completionHandler: nil)
        
    }
    
    
    @IBAction func webadd2(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.joodeskan.sa")! as URL, options: [:], completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Color")
        
        
        playtwo.load(withVideoId: "i1gc-N4A1ug", playerVars: ["playsinline": "1"])
        playtwo.delegate = self
        
        playerVedio.load(withVideoId: "eitBElIDREY", playerVars: ["playsinline": "1"])
        playerVedio.delegate = self
        
    }
    
}
