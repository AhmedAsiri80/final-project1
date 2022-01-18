//
//  MainCell2.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 11/05/1443 AH.
//

import Foundation

import UIKit

class Cell1 : UICollectionViewCell {
    
    
    @IBOutlet weak var logop: UIImageView!
    @IBOutlet weak var lName: UILabel!
    @IBOutlet weak var price1: UILabel!
    
    func setup(Item : Item){
        logop.image = Item.logo
        lName.text = Item.name
        logop.layer.cornerRadius = 50
        // price1.text = "\(Item.price1)"
      
    }
    
    
}



import UIKit

class VC2 : UIViewController {
    
    var selectedpro : Item?
    
  
    @IBOutlet weak var labels: UILabel!
    @IBOutlet weak var price2: UILabel!
    @IBOutlet weak var Name2: UILabel!
    @IBOutlet weak var Image1: UIImageView!
    
    
    @IBAction func addtocart(_ sender: Any) {
        cart.append(selectedpro!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
            self.Image1.layer.cornerRadius = 15
        
        
        if selectedpro != nil{
            Name2.text = selectedpro?.name
            // price2.text = selectedpro?.price1
            labels.text = selectedpro?.spe
            Image1.image = selectedpro!.logo
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func Share(_ sender: Any) {
        let activityVC = UIActivityViewController(activityItems: [self.Image1.image], applicationActivities: nil)
//        let text = "this is share text demo "
//        let URL:NSURL = NSURL(string: "https://www.google.co.in ")!
//        let image = UIImage(named: "الحي")
        
        
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
        
        
        
    }
}



import UIKit

class VC3 : UIViewController ,UITableViewDelegate , UITableViewDataSource{
    
    
    @IBOutlet weak var cartTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTV.delegate = self
        cartTV.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cartTV.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath
        ) as! Cell3
        
        let product = cart[indexPath.row]
        cell.setup(Item: product)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(
            style: .destructive,
            title: "Delete") { _, _, _ in
                cart.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
}


import UIKit

class Cell3 : UITableViewCell{
    
    @IBOutlet weak var imgc: UIImageView!
    @IBOutlet weak var pricec: UILabel!
    @IBOutlet weak var namec: UILabel!
   
    func setup(Item : Item){
        namec.text = Item.name
        imgc.image = Item.logo
        pricec.text = "\(Item.price1)"
    }
    
}
