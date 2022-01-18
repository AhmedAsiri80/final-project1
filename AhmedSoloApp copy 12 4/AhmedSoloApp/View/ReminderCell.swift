//
//  ReminderCell.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 24/04/1443 AH.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class AddViewController: UIViewController {
    
    
    let reminderColl = Firestore.firestore().collection("Reminders")
    
    @IBOutlet weak var lblTitle: UITextField!
    @IBOutlet weak var lblBody: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    public var completion : ((String,String,Date) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor(named: "Color")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(btnSave))
        
    }
    
    @objc func btnSave(){
        
        
        if let titleText = lblTitle.text, !titleText.isEmpty {
            if let bodyText = lblBody.text , !bodyText.isEmpty {
                let targetDate = datePicker.date
                reminderColl.document().setData([
                    
                    "content": lblBody.text
                ], merge: true)
                
                completion?(titleText,bodyText,targetDate)
            }
        }
    }
    
    
    
}

