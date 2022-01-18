//
//  ProfileVC.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 05/05/1443 AH.
//


import UIKit

class MansatVC: UIViewController {
    
    
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var collectionView: PagingCollectionVIew!
    
    let imageArray = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initCollectionView()
    }
}


extension MansatVC {
    
    func initCollectionView() {
        collectionView.scrollInterval = 2
        collectionView.startScrolling()
        pageControll.numberOfPages = imageArray.count
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let currentPage: Int = Int(scrollView.contentOffset.x / collectionView.bounds.size.width)
        pageControll.currentPage = currentPage
    }
}

extension MansatVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PageCell999
        cell.imageView.image = UIImage(named: imageArray[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.collectionView.frame.size.width, height: self.collectionView.frame.size.height)
    }
    
}




import UIKit

class PageCell999: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    
}

