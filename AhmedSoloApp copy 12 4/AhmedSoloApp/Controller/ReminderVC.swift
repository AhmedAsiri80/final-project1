//
//  ReminderVC.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 24/04/1443 AH.
//
//

import Foundation
import UIKit
import FirebaseFirestore

class ReminderVc: UIViewController {
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var reminders = [Reminder]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = UIColor(named: "Color")
        // Do any additional setup after loading the view.
    }
    @IBAction func btnAdd(_ sender: Any) {
        
        guard  let vc = storyboard?.instantiateViewController(identifier: "AddViewController") as? AddViewController else { print("Bulmadı")
            return }
        
        print("Buldu")
        
        vc.title = "New Reminder"
        
        vc.completion = { (title,body,date) in
            
            DispatchQueue.main.async {
                
                self.navigationController?.popViewController(animated: true)
                
                let newReminder = Reminder(title: title, body: body, date: date, identifier: "id_\(title)")
                
                self.reminders.append(newReminder)
                
                self.tableView.reloadData()
                
                
                let content = UNMutableNotificationContent()
                content.title = title
                content.sound = .default
                content.body = body
                
                let targetDate = date
                
                
                let trigger =  UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: targetDate), repeats: false)
                
                let reguest = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(reguest) { (error) in
                    if error != nil {
                        let alert = UIAlertController(title: "Error", message: "Wrong", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                
            }
            
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}

extension ReminderVc : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

extension ReminderVc  : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let row = reminders[indexPath.row]
        
        cell.textLabel?.text = row.title
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd, MMMM, YYYY"
        
        cell.detailTextLabel?.text = formatter.string(from: row.date)
        
        return cell
    }
    
    
}

extension ReminderVc {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (action, sourceView, completionHandler) in
            
            self.reminders.remove(at: indexPath.row)
            self.tableView.reloadData()
            
            completionHandler(true)
            
        }
        
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let doneAction = UIContextualAction(style: .destructive, title: nil) { (action, sourceView, completionHandler) in
            
            let reminder = self.reminders[indexPath.row]
            
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { success, error in
                if success {
                    self.scheduletest(title: reminder.title, body: reminder.body)
                } else if error != nil {
                    print(error?.localizedDescription ?? "Error")
                }
                
            })
            completionHandler(true)
        }
        
        doneAction.image = UIImage(systemName: "checkmark")
        doneAction.backgroundColor = .green
        
        return UISwipeActionsConfiguration(actions: [doneAction])
        
    }
    
    func  scheduletest(title : String, body : String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.sound = .default
        content.body = body
        
        let targetDate = Date().addingTimeInterval(10)
        
        
        let trigger =  UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: targetDate), repeats: false)
        
        let reguest = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(reguest) { (error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: "Wrong", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        
    }
    
}

