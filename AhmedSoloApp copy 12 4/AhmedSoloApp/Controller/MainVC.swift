//
//  MainVC.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 23/04/1443 AH.
//
//


import UIKit

class MaimVC1: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    
    var searchba: Array<Item> = List
    
    @IBOutlet weak var saerchbar: UISearchBar!
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchba = List
        }
        else{
            searchba = List.filter({oneofprod in
                return oneofprod.name.starts(with: searchText)
            })
        }
        picC.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchba.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RestCell", for: indexPath
        ) as! Cell1
        
        let item = searchba[indexPath.row]
        cell.setup(Item: item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenwidth = view.bounds.size.width
        //return CGSize(width: 100, height: 100)
        return CGSize(width: screenwidth / 2, height: screenwidth / 2 )    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let prouduct = searchba[indexPath.row]
        performSegue(withIdentifier: "show", sender:prouduct
        )
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        let v2 = segue.destination as! VC2
        v2.selectedpro = sender as? Item
    }
    
    @IBOutlet weak var picC: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        searchba = List
        picC.reloadData()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // picsflowlayot.itemSize = CGSize (width: 100, height: 100)
        
        
        //    picC.collectionViewLayout
        saerchbar.delegate = self
        picC.delegate = self
        picC.dataSource = self
        // Do any additional setup after loading the view.
    }
    
}
